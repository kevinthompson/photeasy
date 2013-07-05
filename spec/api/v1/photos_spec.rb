require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource 'Photos' do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'

  parameter :auth_token, 'Authentication token'

  let(:user){ create(:user) }
  let(:auth_token){ user.authentication_token }
  let(:raw_post) { params.to_json }

  get 'https://app.photeasy.com/api/v1/photos.json' do

    before do
      create(:photo, user: user)
    end

    example_request 'List Photos' do
      response_status.should eql(200)
      response_json = JSON.parse(response_body)

      response_json['errors'].should be_empty
      photos = response_json['data']
      photos.all?{ |photo| photo['filename'].present? }.should be_true
    end
  end
end