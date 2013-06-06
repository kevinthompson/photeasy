class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable,
  devise :database_authenticatable, :registerable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :async,
         :omniauthable, omniauth_providers: [:dropbox]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name,
                  :password, :password_confirmation, :remember_me,
                  :provider, :uid, :dropbox_token, :dropbox_secret,
                  :photos_imported_at

  has_many :photos, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :orders
  has_many :shares, through: :albums

  before_save :ensure_authentication_token
  after_create :queue_photo_import

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
    self.update_attribute(:importing_photos, true)
    providers.each do |provider|
      PhotoImporter.new(self, provider).import
      Notification.new(channel: notification_channel, event: :import_photos, data: photos).send
    end
  ensure
    self.update_attribute(:importing_photos, false)
  end

  def queue_photo_import
    PhotoImportWorker.perform_async(user_id: id)
  end

  def notification_channel
    Digest::MD5.hexdigest([email,created_at.to_i].join)
  end

  private

  def self.password_token
    Devise.friendly_token[0,20]
  end

end
