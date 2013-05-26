class Payment < ActiveRecord::Base
  attr_accessible :order_id, :status
  belongs_to :order
end
