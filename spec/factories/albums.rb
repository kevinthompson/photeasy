# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :album do
    name { Faker::Company.name }
    user
    photos {
      Array(2..5).sample.times.map do
        create(:photo, user: user)
      end
    }
  end
end
