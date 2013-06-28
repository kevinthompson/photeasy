require 'spec_helper'

describe Album do
  let(:album){ build(:album) }

  describe '#save' do
    context 'with shares' do
      it 'creates new shares associated to album' do
        album = build(:album)
        album.shares << build(:share, album: album)
        expect{ album.save }.to change{ Share.where(album_id: album.id).count }.from(0).to(1)
      end
    end
  end

  describe '#update_attributes' do
    it 'accepts an array of photo_ids' do
      photo = create(:photo)
      album.photos = []
      album.save
      album.photo_ids.should be_empty
      album.update_attributes(photo_ids: [photo.id])
      album.photo_ids.should == [photo.id]
    end
  end
end
