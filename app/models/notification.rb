class Notification
  attr_accessor :channel, :event, :data

  def initialize(args = {})
    args.each do |key, value|
      self.send("#{key}=", value) if self.respond_to?("#{key}=")
    end
  end

  def push
    Pusher[channel].trigger(event, data)
  end

end