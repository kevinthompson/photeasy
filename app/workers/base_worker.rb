class BaseWorker
  include Sidekiq::Worker

  def send_notification(args = {})
    args.reverse_merge!({
      channel: "#{channel_type}_notifications",
      event: channel_type,
      data: { message: "Notification from #{self.class}." }
    })
    notification = Notification.new(args)
    notification.push
  end

  private

  def channel_type
    @channel_type ||= self.class.to_s.underscore[/(.*?)_worker/, 1]
  end

end