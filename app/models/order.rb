class Order < ActiveRecord::Base
  attr_accessible :album_id, :status, :user_id
  belongs_to :user
  belongs_to :album
  has_many :prints
  has_many :payments
end
