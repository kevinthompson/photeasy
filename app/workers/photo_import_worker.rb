class PhotoImportWorker < BaseWorker

  def perform(user_id)
    user = User.find(user_id)
    user.import_photos_from_providers if user.present?
  end

end