# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :share do
    email 'lana@isis.org'
    visits 1
    album
    user
  end
end
