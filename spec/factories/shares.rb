# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :share do
    disabled_at "2013-05-28 22:43:46"
    email "MyString"
    visits 1
    album_id 1
  end
end
