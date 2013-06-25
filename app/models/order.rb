class Order < ActiveRecord::Base
  attr_accessible :album_id, :status, :user_id, :prints_attributes

  belongs_to :album
  belongs_to :share
  belongs_to :user
  has_many :prints
  has_many :payments
  accepts_nested_attributes_for :prints

  validates :album_id, :prints, presence: true
end
