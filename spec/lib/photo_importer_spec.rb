require 'spec_helper'

describe PhotoImporter do
  let(:user){ create(:user) }

  Provider = Struct.new(:photos)
  ProviderPhoto = Struct.new(:id, :filename, :path)

  before(:each) do
    Photo.any_instance.stub(:import_thumbnail)
  end

  describe '#import' do
    it 'adds photo records to an object' do
      provider_photo = ProviderPhoto.new('ph0t0', 'sample.jpg', '/sample.jpg')
      provider = Provider.new([provider_photo])
      photo_importer = PhotoImporter.new(user, provider)
      expect{ photo_importer.import }.to change{ user.photos.count }.from(0).to(1)
    end

    it 'deletes all photos if no photos are returned from provider' do
      user.photos.create(provider_id: 'ph0t0', provider: :dropbox)
      user.photos.create(provider_id: '1m4g3', provider: :dropbox)
      provider = Provider.new([])
      photo_importer = PhotoImporter.new(user, provider)
      expect{ photo_importer.import }.to change{ user.photos.count }.from(2).to(0)
    end

    it 'deletes photos that have been removed from the provider' do
      user.photos.create(provider_id: 'ph0t0', provider: :dropbox)
      user.photos.create(provider_id: '1m4g3', provider: :dropbox)
      provider_photo = ProviderPhoto.new('1m4g3', 'image.jpg', '/image.jpg')
      provider = Provider.new([provider_photo])
      photo_importer = PhotoImporter.new(user, provider)
      expect{ photo_importer.import }.to change{ user.photos.count }.from(2).to(1)
    end
  end

end