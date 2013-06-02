class ShareSerializer < ActiveModel::Serializer
  attributes :uuid
  has_one :album, serializer: ShareAlbumSerializer
  has_one :user, serializer: ShareUserSerializer
end