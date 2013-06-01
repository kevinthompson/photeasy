require 'spec_helper'

describe 'Photos', type: :api do
  let(:user){ create(:user) }
  let(:url) { '/api/v1/photos.json' }

  before do
    host! 'app.photeasy.com'
  end

  context 'when the user is not signed in' do
    it 'returns an errors array with a 401 status code' do
      get url
      response.status.should eql(401)
      response_json = JSON.parse(response.body)
      response_json['errors'].should_not be_empty
    end
  end

  context 'when the user is signed in' do
    describe 'GET /api/v1/photos' do
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
end