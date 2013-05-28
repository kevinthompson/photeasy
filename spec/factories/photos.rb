# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    filename 'example.jpg'
    provider 'dropbox'
    provider_id 'dr0pb0x'
    url '/path/to/example.jpg'
    user
  end
end
