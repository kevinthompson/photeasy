require 'spec_helper'

describe 'API', type: :api do
  let(:url) { '/api/v1/photos.json' }

  before do
    host! 'app.photeasy.com'
  end

  context 'when the user is not signed in' do

    it 'responds with header status code 401' do
      get url
      response.status.should eql(401)
    end

    it 'returns an error' do
      get url
      response_json = JSON.parse(response.body)
      response_json['errors'].should_not be_empty
    end

  end
end