FactoryGirl.define do
  factory :user do
    name 'Sterling Archer'
    email 'sterling@isis.org'
    password 'dutchess'

    factory :user_with_dropbox_uid do
      uid 95241
      provider :dropbox
    end
  end
end