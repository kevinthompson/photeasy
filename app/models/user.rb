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
                  :provider, :uid, :dropbox_token, :dropbox_secret

  def self.find_for_dropbox_oauth(auth, signed_in_resource=nil)
    logger.debug auth.inspect
    user = User.where(provider: auth.provider, uid: auth.uid.to_s).first
    unless user
      user = User.create(
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

  def providers
    [DropboxProvider.new(dropbox_token, dropbox_secret)]
  end

  def photos
    providers.map(&:photos).flatten
  end

  def is_admin?
    true
  end

  private

  def self.password_token
    Devise.friendly_token[0,20]
  end

end
