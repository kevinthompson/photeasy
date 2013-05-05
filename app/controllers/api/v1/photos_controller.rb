class Api::V1::PhotosController < Api::V1::BaseController
  respond_to :json

  def index
    provider = DropboxProvider.new(current_user.dropbox_token, current_user.dropbox_secret)
    response = {
      data: {
        photos: provider.photos
      },
      status: 200,
      errors: []
    }
    respond_with response
  end
end