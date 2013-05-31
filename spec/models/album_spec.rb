require 'spec_helper'

describe Album do
  let(:album){ create(:album) }

  describe '#update_attributes' do
    it 'accepts an array of photo_ids' do
      photo = create(:photo)
      album.photo_ids.should be_empty
      album.update_attributes(photo_ids: [photo.id])
      album.photo_ids.should == [photo.id]
    end
  end
end
