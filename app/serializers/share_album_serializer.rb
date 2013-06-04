class ShareAlbumSerializer < ActiveModel::Serializer
  attributes :name
  has_many :photos
end
