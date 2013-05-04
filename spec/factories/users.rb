FactoryGirl.define do
  factory :user do
    name 'Joe User'
    email 'test@test.com'
    password 'password'

    factory :user_with_dropbox_uid do
      uid 95241
      provider :dropbox
    end
  end
end