class PhotosController < ApplicationController
  before_filter :authenticate_user!

  def thumbnail
    params[:size] ||= :medium
    photo = current_user.photos.find(params[:photo_id])
    send_data(photo.thumbnail(params[:size]), filename: photo.filename, type: 'image/png')
  end

end