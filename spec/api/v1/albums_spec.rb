require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource 'Albums' do
  parameter :auth_token, 'Authentication token'

  let(:user){ create(:user) }
  let(:photo){ create(:photo, user: user) }
  let(:auth_token){ user.authentication_token }

  get 'https://app.photeasy.com/api/v1/albums.json' do

    before do
      create(:album, name: 'Example Album', user: user)
    end

    example_request 'List Albums' do
      status.should == 200
      response_json = JSON.parse(response_body)
      response_json['errors'].should be_empty
      albums = response_json['data']
      albums.any?{ |album| album['name'] == 'Example Album' }.should be_true
    end
  end

  post 'https://app.photeasy.com/api/v1/albums.json' do
    parameter :name, 'The name of the album'
    parameter :photo_ids, 'An array of ids relating to photos'
    scope_parameters :album, [:name, :photo_ids]

    let(:name){ 'New Album' }
    let(:photo_ids){ [photo.id] }

    example_request 'Create Album' do
      status.should eql(201)
      response_json = JSON.parse(response_body)
      response_json['errors'].should be_empty

      album = response_json['data']
      album['name'].should == 'New Album'
      album['id'].should_not be_nil
      album['photos'].should_not be_nil
    end

    example_request 'Create Album: Invalid Data', { album: nil } do
      response_status.should eql(422)
      response_json = JSON.parse(response_body)
      response_json['errors'].should_not be_empty
      response_json['errors'].any?{ |error| error[1].include?("can't be blank") }.should be_true

      album = response_json['data']
      album['id'].should be_nil
    end
  end

  get 'https://app.photeasy.com/api/v1/albums/:id.json' do

    let(:album){ create(:album, name: 'Example Album', user: user) }
    let(:id){ album.id }

    example_request 'Show Album' do
      response_status.should eql(200)
      response_json = JSON.parse(response_body)
      response_json['errors'].should be_empty

      existing_album = response_json['data']
      existing_album['id'].should == album.id
      existing_album['name'].should == 'Example Album'
    end
  end

  put 'https://app.photeasy.com/api/v1/albums/:id.json' do
    parameter :name, 'The name of the album'
    parameter :photo_ids, 'An array of ids relating to photos'
    parameter :shares_attributes, 'An array share objects'
    scope_parameters :album, [:name, :photo_ids, :shares_attributes]

    let!(:album){ create(:album, name: 'Existing Album', user: user) }
    let(:id){ album.id }

    example_request 'Update Album', { album: { name: 'Updated Album' } } do
      response_status.should eql(200)
      response_json = JSON.parse(response_body)

      updated_album = response_json['data']
      updated_album['name'].should == 'Updated Album'
    end

    example_request 'Update Album: Shares', album: { shares_attributes: [ { email: 'sterling@isis.org' } ] } do
      response_status.should eql(200)
      response_json = JSON.parse(response_body)
      response_json['errors'].should be_empty
      Share.where(album_id: album['id'], email: 'sterling@isis.org').count.should == 1
    end

    example_request 'Update Album: Invalid Data', album: { name: '', user_id: nil } do
      response_status.should eql(422)
      response_json = JSON.parse(response_body)
      response_json['errors'].should_not be_empty
      response_json['errors'].any?{ |error| error[1].should include(%Q[can't be blank]) }
    end
  end

  delete 'https://app.photeasy.com/api/v1/albums/:id.json' do
    let!(:album){ create(:album, user: user) }
    let(:id){ album.id }

    example_request 'Delete Album' do
      response_status.should eql(200)
      response_json = JSON.parse(response_body)
      response_json['data'].should be_empty
      response_json['errors'].should be_empty
    end
  end

end