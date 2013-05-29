require 'spec_helper'

describe Album do
  describe '#update_attributes' do
    it 'accepts a photo_ids array' do
      photo = create(:photo)
      album = create(:album)
      album.photo_ids.should be_empty
      album.update_attributes(photo_ids: [photo.id])
      album.photo_ids.should == [photo.id]
    end
  end
end
