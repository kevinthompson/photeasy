require 'spec_helper'

describe '/api/v1/collections', type: :api do
  let(:user){ create(:user) }
  let(:url) { "/api/v1/users/#{user.id}/collections.json" }

  before do
    sign_in user
  end

  describe 'GET /api/v1/users/:id/collections' do
    before do
      create(:collection, user: user)
    end

    it 'returns an array of collections' do
      get url

      response.status.should eql(200)
      response_json = JSON.parse(response.body)
      response_json['errors'].should be_empty

      collections = response_json['data']
      collections.any?{ |collection| collection['name'] == 'Example Collection' }.should be_true
    end
  end

  describe 'POST /api/v1/users/:id/collections' do
    context 'when collection data is not valid' do
    end

    context 'when collection data is valid' do
      it 'creates a new collection' do
        post url, collection: { name: 'New Collection' }

        response.status.should eql(201)
        response_json = JSON.parse(response.body)
        response_json['errors'].should be_empty

        collection = response_json['data']
        collection['name'].should == 'New Collection'
        collection['id'].should_not be_nil
      end
    end
  end
end