class PhotoImportWorker < BaseWorker

  def perform(user_id, notification_channel = nil)
    @notification_channel = notification_channel
    user = User.find(user_id)
    user.dropbox.photos.each do |photo|
      # Store photos
    end
  end

end