class PhotoImportWorker < BaseWorker

  def perform(args={})
    args = args.with_indifferent_access
    user = User.find(args[:user_id])
    user.import_photos if user.present? && !user.importing_photos
  end

end