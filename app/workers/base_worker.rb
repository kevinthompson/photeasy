class BaseWorker
  include Sidekiq::Worker

  private

  def send_notification(args = {})
    args.reverse_merge!({
      channel: @notification_channel,
      event: channel_type,
      data: { message: "Notification from #{self.class}." }
    })
    notification = Notification.new(args)
    notification.send
  end

  def channel_type
    @channel_type ||= self.class.to_s.underscore[/(.*?)_worker/, 1]
  end

end