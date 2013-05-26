class PhotoImportWorker < BaseWorker

  def perform(user_id, notification_channel = nil)
    @notification_channel = notification_channel
    user = User.find(user_id)
    user.photos.destroy_all
    user.dropbox.photos.each do |file|
      photo = user.photos.where(provider: :dropbox, provider_id: file.id).first_or_initialize
      photo.update_attributes(url: file.path, filename: file.filename)
      photo.upload_from_dropbox
    end
    user.update_attribute(:photos_imported_at, Time.now)
  end

end