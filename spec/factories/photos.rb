# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    user_id 1
    provider "MyString"
    provider_id "MyString"
    url "MyString"
  end
end
