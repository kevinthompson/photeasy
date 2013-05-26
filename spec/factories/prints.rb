# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :print do
    size "MyString"
    photo_id 1
    order_id 1
    quantity 1
  end
end
