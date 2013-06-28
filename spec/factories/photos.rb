# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    word = Faker::Lorem.word

    filename "#{word}.jpg"
    provider 'dropbox'
    provider_id { Faker::Lorem.characters(64) }
    url "/path/to/#{word}.jpg"
    user
  end
end
