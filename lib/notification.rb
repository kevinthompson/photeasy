class Notification

  def initialize(args = {})
    args.each do |key, value|
      self.send("#{key}=", value) if self.respond_to?("#{key}=")
    end
  end

  def send
    Pusher[channel].trigger(event, data)
  end

end