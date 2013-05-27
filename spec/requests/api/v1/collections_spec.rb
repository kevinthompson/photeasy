require 'spec_helper'

describe '/api/v1/collections', type: :api do
  let(:user){ create(:user) }
  let(:url) { "/api/v1/users/#{user.id}/collections.json" }

  describe 'GET /api/users/:id/v1/collections' do
    before do
      create(:collection, user: user)
    end

    it 'returns an array of collections' do
      sign_in user
      get url

      response.status.should eql(200)
      response_json = JSON.parse(response.body)
      response_json['errors'].should be_empty

      collections = response_json['data']
      collections.any?{ |collection| collection['name'] == 'Example Collection' }.should be_true
    end
  end
end