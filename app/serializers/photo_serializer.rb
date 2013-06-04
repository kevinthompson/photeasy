class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :filename, :images

  def include_id?
    current_user.present? && current_user.id == object.user_id
  end
end
