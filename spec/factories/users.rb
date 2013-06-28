FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(64) }

    factory :user_with_dropbox_uid do
      uid 95241
      provider :dropbox
    end
  end
end