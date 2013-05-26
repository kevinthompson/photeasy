class Collection < ActiveRecord::Base
  attr_accessible :name, :user_id, :photos
  has_and_belongs_to_many :photos
  has_many :orders
end
