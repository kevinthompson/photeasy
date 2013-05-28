require 'spec_helper'

describe '/api/v1/collections', type: :api do
  let(:user){ create(:user) }
  let(:url) { "/api/v1/users/#{user.id}/collections.json" }

  before do
    host! 'app.example.com'
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
      it 'returns validation errors' do
        post url, collection: {}

        response.status.should eql(422)
        response_json = JSON.parse(response.body)
        response_json['errors'].should_not be_empty
        response_json['errors'].any?{ |error| error[1].include?("can't be blank") }.should be_true

        collection = response_json['data']
        collection['id'].should be_nil
      end
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

  describe 'GET /api/v1/users/:user_id/collections/:id' do
    let!(:collection){ create(:collection, name: 'Existing Collection', user: user) }
    let(:url){ "/api/v1/users/#{user.id}/collections/#{collection.id}.json" }

    it 'returns the selected collection' do
      get url

      response.status.should eql(200)
      response_json = JSON.parse(response.body)
      response_json['errors'].should be_empty

      existing_collection = response_json['data']
      existing_collection['id'].should == collection.id
      existing_collection['name'].should == 'Existing Collection'
    end
  end

  describe 'PUT /api/v1/users/:user_id/collections/:id' do
    let!(:collection){ create(:collection, name: 'Existing Collection', user: user) }
    let(:url){ "/api/v1/users/#{user.id}/collections/#{collection.id}.json" }

    context 'when collection data is not valid' do
      it 'returns validation errors' do
        put url, collection: { name: '', user_id: nil }

        response.status.should eql(422)
        response_json = JSON.parse(response.body)
        response_json['errors'].should_not be_empty
        response_json['errors'].any?{ |error| error[1].should include(%Q[can't be blank]) }
      end
    end

    context 'when collection data is valid' do
      it 'updates the collection' do
        put url, collection: { name: 'Updated Collection' }

        response.status.should eql(200)
        response_json = JSON.parse(response.body)

        updated_collection = response_json['data']
        updated_collection['name'].should == 'Updated Collection'
      end
    end
  end

  describe 'DELETE /api/v1/users/:user_id/collections/:id' do
    let!(:collection){ create(:collection, name: 'Existing Collection', user: user) }
    let(:url){ "/api/v1/users/#{user.id}/collections/#{collection.id}.json" }

    it 'deletes the collection' do
      delete url

      response.status.should eql(200)
      response_json = JSON.parse(response.body)
      response_json['data'].should be_empty
      response_json['errors'].should be_empty
    end
  end
end