require 'spec_helper'

describe Photo do
  let(:photo){ create(:photo) }

  it { should belong_to(:user) }
  it { should have_many(:prints) }
  it { should have_many(:shares).through(:albums) }

  it { should validate_presence_of :provider }
  it { should validate_presence_of :provider_id }
  it { should validate_presence_of :user_id }

  describe '#images' do
    it 'returns a hash of size names and image urls' do
      photo.images.should be_a(Hash)
      photo.images.keys.should include('small')
      photo.images.keys.should include('large')
    end

    it 'returns and image url with each image size' do
      photo.images.all?{ |key, value| value =~ /(gif|jpg|png)$/ }.should be_true
    end
  end

  describe '#import_thumbnail' do
    before do
      image_file = File.open(Rails.root.join('spec','fixtures','images','thumbnail_1.jpg'), 'rb')
      image_data = image_file.read
      Photo.any_instance.stub_chain(:user,:dropbox,:client,:raw,:thumbnails).and_return(image_data)
    end

    it 'attaches a thumbnail from provider' do
      expect{ photo.import_thumbnail }.to change{ photo.thumbnail.url }
    end
  end
end
