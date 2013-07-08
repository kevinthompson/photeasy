require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource 'Orders' do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'

  let(:user){ create(:user) }
  let(:album){ create(:album) }
  let(:photo){ create(:photo) }
  let(:order){ build(:order) }
  let(:prints_attributes){ [{size: '4x6', quantity: 1, photo_id: photo.id}] }
  let(:album_id){ album.id }
  let(:user_id){ user.id }
  let(:raw_post) { params.to_json }

  post 'https://app.photeasy.com/api/v1/orders.json' do
    parameter :prints_attributes, 'An array of Print objects containing type and quantity'
    parameter :album_id, 'Album ID'
    parameter :user_id, 'User ID'
    scope_parameters :order, [:prints_attributes, :album_id, :user_id]
    required_parameters :album_id, :prints_attributes

    example_request 'Create Order' do
      response_json = JSON.parse(response_body)
      response_json['errors'].should be_empty

      order = response_json['data']
      order['id'].should_not be_nil
      order['prints'].should_not be_nil

      status.should eql(201)
    end
  end

end