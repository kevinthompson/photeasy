require 'spec_helper'

describe Collection do
  describe '#update_attributes' do
    it 'accepts a photo_ids array' do
      photo = create(:photo)
      collection = create(:collection)
      collection.photo_ids.should be_empty
      collection.update_attributes(photo_ids: [photo.id])
      collection.photo_ids.should == [photo.id]
    end
  end
end
