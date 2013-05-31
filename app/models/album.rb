class Album < ActiveRecord::Base
  attr_accessible :name, :user_id, :photos, :photo_ids, :shares_attributes

  belongs_to :user
  has_many :orders
  has_many :shares, dependent: :destroy
  has_and_belongs_to_many :photos
  accepts_nested_attributes_for :shares

  validates :name, :user_id, presence: true
  validates :name, uniqueness: { scope: :user_id }
end
