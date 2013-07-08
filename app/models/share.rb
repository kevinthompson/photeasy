class Share < ActiveRecord::Base
  include Extensions::UUID
  before_validation :ensure_user_id
  after_create :queue_new_share_email

  belongs_to :album
  belongs_to :user

  validates :user_id, presence: true
  validates :album, :user, associated: true
  validates :email, uniqueness: { scope: :album_id }

  def from
    user.try(:name) || 'A user'
  end

  private

  def queue_new_share_email
    ShareMailer.delay.new_share(share_id: self)
  end

  def ensure_user_id
    self.user_id = album.user_id if album.present?
  end
end
