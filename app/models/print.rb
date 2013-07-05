class Print < ActiveRecord::Base
  VALID_SIZES = %w[4x6 5x7 8x10]

  belongs_to :order
  belongs_to :photo

  validates :photo_id, :quantity, :size, presence: true
  validates :order, :photo, associated: true
  validates :size, inclusion: { in: VALID_SIZES, message: "%{value} is not a valid size." }
  validates :quantity, numericality: { greater_than: 0 }
  validates :photo_id, uniqueness: { scope: [:order_id, :size] }
  validates :size, uniqueness: { scope: [:order_id, :photo_id] }
end
