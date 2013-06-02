require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource 'Shares' do
  parameter :auth_token, 'Authentication token'

  let(:user){ create(:user, name: 'Dylan Hudson') }
  let(:photo){ create(:photo, user: user) }
  let(:album){ create(:album, photo_ids: [photo.id]) }
  let(:auth_token){ user.authentication_token }
  let(:share){ create(:share, user: user, album: album) }
  let(:id){ share.id }

  get 'https://app.photeasy.com/api/v1/shares/:id.json' do
    example_request 'Show Share' do
      response_status.should eql(200)
      response_json = JSON.parse(response_body)
      response_json['errors'].should be_empty

      share = response_json['data']
      share ['uuid'].should_not be_nil

      album = share['album']
      album.should_not be_nil
      album['id'].should be_nil
      album['photos'].should_not be_empty

      user = share['user']
      user['id'].should be_nil
      user['name'].should == 'Dylan Hudson'
    end
  end
end