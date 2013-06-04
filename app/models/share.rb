class Share < ActiveRecord::Base
  include Extensions::UUID
  before_validation :ensure_user_id
  after_create :send_email

  attr_accessible :album_id, :disabled_at, :email, :user_id

  belongs_to :album
  belongs_to :user

  validates :album_id, :user_id, presence: true

  def send_email
    ShareMailer.delay.new_share(self)
  end

  private

  def ensure_user_id
    self.user_id = album.user_id if album.present?
  end
end
