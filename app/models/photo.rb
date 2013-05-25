class Photo < ActiveRecord::Base
  MIN_BYTE_SIZE = 1048576

  attr_accessible :provider, :provider_id, :url, :user_id
  belongs_to :user
end
