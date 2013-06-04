require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource 'Users' do
  parameter :auth_token, 'Authentication token'

  let(:user){ create(:user, name: 'Sterling Archer') }
  let(:auth_token){ user.authentication_token }

  get 'https://app.photeasy.com/api/v1/users/current.json' do
    example_request 'Show Current User' do
      response_status.should eql(200)
      response_json = JSON.parse(response_body)
      response_json['errors'].should be_empty
      user = response_json['data']
      user['id'].should_not be_nil
      user['name'].should == 'Sterling Archer'
    end
  end
end