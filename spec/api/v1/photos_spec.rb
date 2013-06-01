require 'spec_helper'

describe 'Photos', type: :api do
  let(:user){ create(:user) }
  let(:url) { '/api/v1/photos.json' }

  before do
    host! 'app.photeasy.com'
  end

  describe 'GET /api/v1/photos.json' do
    before do
      create(:photo, user: user)
    end

    it 'returns an array of photos' do
      sign_in user
      get url

      response.status.should eql(200)
      response_json = JSON.parse(response.body)

      response_json['errors'].should be_empty
      photos = response_json['data']
      photos.any?{ |photo| photo['filename'] == 'example.jpg' }.should be_true
    end
  end
end