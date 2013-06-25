class Share < ActiveRecord::Base
  include Extensions::UUID
  before_validation :ensure_user_id
  after_create :queue_new_share_email

  attr_accessible :album_id, :disabled_at, :email, :user_id

  belongs_to :album
  belongs_to :user

  validates :user_id, presence: true
  validates :album, :user, associated: true
  validates :email, uniqueness: { scope: :album_id }

  def queue_new_share_email
    ShareMailer.delay.new_share(self)
  end

  private

  def ensure_user_id
    self.user_id = album.user_id if album.present?
  end
end
