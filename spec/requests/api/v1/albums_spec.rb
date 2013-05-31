require 'spec_helper'

describe '/api/v1/albums', type: :api do
  let(:user){ create(:user) }
  let(:url) { "/api/v1/users/#{user.id}/albums.json" }

  before do
    host! 'app.photeasy.com'
    sign_in user
  end

  describe 'GET /api/v1/users/:id/albums' do
    before do
      create(:album, user: user)
    end

    it 'returns an array of albums' do
      get url

      response.status.should eql(200)
      response_json = JSON.parse(response.body)
      response_json['errors'].should be_empty

      albums = response_json['data']
      albums.any?{ |album| album['name'] == 'Example Album' }.should be_true
    end
  end

  describe 'POST /api/v1/users/:id/albums' do
    context 'when album data is not valid' do
      it 'returns validation errors' do
        post url, album: {}

        response.status.should eql(422)
        response_json = JSON.parse(response.body)
        response_json['errors'].should_not be_empty
        response_json['errors'].any?{ |error| error[1].include?("can't be blank") }.should be_true

        album = response_json['data']
        album['id'].should be_nil
      end
    end

    context 'when album data is valid' do
      it 'creates a new album' do
        post url, album: { name: 'New Album' }

        response.status.should eql(201)
        response_json = JSON.parse(response.body)
        response_json['errors'].should be_empty

        album = response_json['data']
        album['name'].should == 'New Album'
        album['id'].should_not be_nil
      end
    end
  end

  describe 'GET /api/v1/users/:user_id/albums/:id' do
    let!(:album){ create(:album, name: 'Existing Album', user: user) }
    let(:url){ "/api/v1/users/#{user.id}/albums/#{album.id}.json" }

    it 'returns the selected album' do
      get url

      response.status.should eql(200)
      response_json = JSON.parse(response.body)
      response_json['errors'].should be_empty

      existing_album = response_json['data']
      existing_album['id'].should == album.id
      existing_album['name'].should == 'Existing Album'
    end
  end

  describe 'PUT /api/v1/users/:user_id/albums/:id' do
    let!(:album){ create(:album, name: 'Existing Album', user: user) }
    let(:url){ "/api/v1/users/#{user.id}/albums/#{album.id}.json" }

    context 'when album data is not valid' do
      it 'returns validation errors' do
        put url, album: { name: '', user_id: nil }

        response.status.should eql(422)
        response_json = JSON.parse(response.body)
        response_json['errors'].should_not be_empty
        response_json['errors'].any?{ |error| error[1].should include(%Q[can't be blank]) }
      end
    end

    context 'when album data is valid' do
      it 'updates the album' do
        put url, album: { name: 'Updated Album' }

        response.status.should eql(200)
        response_json = JSON.parse(response.body)

        updated_album = response_json['data']
        updated_album['name'].should == 'Updated Album'
      end
    end

    context 'when share objects are included' do
      it 'creates new shares' do
        put url, album: { shares_attributes: [ { email: 'sterling@isis.org' } ] }

        response.status.should eql(200)
        response_json = JSON.parse(response.body)
        response_json['errors'].should be_empty

        Share.where(album_id: album['id'], email: 'sterling@isis.org').count.should == 1
      end
    end
  end

  describe 'DELETE /api/v1/users/:user_id/albums/:id' do
    let!(:album){ create(:album, name: 'Existing Album', user: user) }
    let(:url){ "/api/v1/users/#{user.id}/albums/#{album.id}.json" }

    it 'deletes the album' do
      delete url

      response.status.should eql(200)
      response_json = JSON.parse(response.body)
      response_json['data'].should be_empty
      response_json['errors'].should be_empty
    end
  end
end