class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:dropbox]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name,
                  :password, :password_confirmation, :remember_me,
                  :provider, :uid, :dropbox_token, :dropbox_secret,
                  :photos_imported_at

  has_many :photos
  has_many :collections
  has_many :orders

  after_create :import_photos

  def self.find_for_dropbox_oauth(auth, signed_in_resource=nil)
    user = where(provider: auth.provider, uid: auth.uid.to_s).first
    unless user
      user = create(
        name: auth.extra.raw_info.name,
        provider: auth.provider,
        uid: auth.uid,
        email: auth.info.email,
        password: password_token,
        dropbox_token: auth.credentials.token,
        dropbox_secret: auth.credentials.secret
      )
    end
    user
  end

  def dropbox
    DropboxProvider.new(dropbox_token, dropbox_secret)
  end

  def is_admin?
    admin
  end

  def providers
    [dropbox]
  end

  def import_photos
    providers.each do |provider|
      provider.photos.each do |file|
        photo = photos.where(provider: :dropbox, provider_id: file.id).first_or_initialize
        if photo.new_record?
          photo.update_attributes(url: file.path, filename: file.filename)
          photo.import_image_from_provider
        end
      end
      photos.where('provider_id not in (?)', provider.photos.map(&:id)).destroy_all
    end
    update_attribute(:photos_imported_at, Time.now)
  end

  private

  def self.password_token
    Devise.friendly_token[0,20]
  end

end
