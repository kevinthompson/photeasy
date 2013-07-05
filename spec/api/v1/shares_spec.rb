require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource 'Shares' do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'

  let(:user){ create(:user) }
  let(:share){ create(:share, user: user) }
  let(:id){ share.uuid }

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
      user.should_not be_nil
      user['id'].should be_nil
      user['name'].should_not be_nil
    end
  end
end