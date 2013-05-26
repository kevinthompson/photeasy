class Print < ActiveRecord::Base
  VALID_SIZES = %w[4x6 5x7 8x10]

  attr_accessible :order_id, :photo_id, :quantity, :size
  belongs_to :order
  belongs_to :photo

  validates :order_id, :photo_id, :quantity, :size, presence: true
  validates :size, inclusion: { in: VALID_SIZES, message: "%{value} is not a valid size." }
end
