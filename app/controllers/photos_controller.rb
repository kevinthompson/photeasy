class PhotosController < ApplicationController

  def image
    params[:size] ||= :medium
    photo = current_user.photos.find(params[:photo_id])
    send_data(photo.images(size), filename: photo.filename, type: 'image/png')
  end

end