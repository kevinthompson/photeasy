class PhotoImporter
  attr_reader :object, :provider

  def initialize(object, provider)
    @object = object
    @provider = provider
  end

  def import
    provider.photos.each{ |provider_photo| import_photo(provider_photo) }
    delete_missing_photos
    object.update_attribute(:photos_imported_at, Time.now)
  end

  private

  def import_photo(provider_photo)
    photo = object.photos.where(provider: :dropbox, provider_id: provider_photo.id).first_or_initialize
    if photo.new_record?
      photo.update_attributes(url: provider_photo.path, filename: provider_photo.filename)
      photo.import_thumbnail
    end
  end

  def delete_missing_photos
    provider_photo_ids = provider.photos.map(&:id)
    if provider_photo_ids.empty?
      object.photos.destroy_all
    else
      object.photos.where('provider_id not in (?)', provider.photos.map(&:id)).destroy_all
    end
  end

end