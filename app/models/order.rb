class Order < ActiveRecord::Base
  attr_accessible :collection_id, :status, :user_id
  belongs_to :user
  belongs_to :collection
end
