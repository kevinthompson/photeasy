class Collection < ActiveRecord::Base
  attr_accessible :name, :user_id, :photos, :photo_ids
  has_and_belongs_to_many :photos
  has_many :orders
  belongs_to :user

  validates :name, :user_id, presence: true
  validates :name, uniqueness: { scope: :user_id }
end
