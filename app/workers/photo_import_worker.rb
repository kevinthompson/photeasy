class PhotoImportWorker < BaseWorker

  def perform(args={})
    user = User.find(args[:user_id])
    user.import_photos if user.present? && !user.importing_photos
  end

end