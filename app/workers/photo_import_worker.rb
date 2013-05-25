class PhotoImportWorker < BaseWorker

  def perform(user_id, notification_channel = nil)
    @notification_channel = notification_channel
    user = User.find(user_id)
    user.dropbox.photos.each do |photo|
      photo = user.photos.where(provider: :dropbox, provider_id: photo.id).first_or_initialize
      photo.update_attribute(url: photo.path, filename: photo.filename)
    end
    user.update_attribute(:photos_imported_at, Time.now)
  end

end