# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :print do
    size '4x6'
    quantity { Array(1..4).sample }
    order
    photo
  end
end
