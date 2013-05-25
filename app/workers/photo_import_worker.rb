class PhotoImportWorker
  include Sidekiq::Worker

  def perform(provider)
    # do stuff
  end
end