class OrderSerializer < ActiveModel::Serializer
  attributes :id, :status, :created_at, :updated_at, :share_id
  has_many :prints
end
