# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :share do
    email { Faker::Internet.email }
    visits 1
    user
    album { create(:album, user: user) }
  end
end
