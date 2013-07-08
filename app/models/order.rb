class Order < ActiveRecord::Base
  after_update :queue_order_completion, if: :ready_to_submit?

  belongs_to :album
  belongs_to :share
  belongs_to :user
  has_many :prints
  has_many :payments
  accepts_nested_attributes_for :prints

  validates :album_id, :user_id, presence: true

  def paid?
    payments.map(&:successful?).any?
  end

  def ready_to_submit?
    self.paid? && self.prints.present?
  end

  def submit
    submission = OrderSubmission.new(self)
    submission.submit
  end

  private

  def queue_order_completion
    queue_submission
    queue_confirmation_email
  end

  def queue_submission
    OrderSubmissionWorker.perform_async(order_id: id)
  end

  def queue_confirmation_email
    OrderMailer.delay.confirmation(order_id: id)
  end

end
