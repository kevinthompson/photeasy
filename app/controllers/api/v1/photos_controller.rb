class Api::V1::PhotosController < Api::V1::BaseController
  respond_to :json

  def index
    @response = {
      data: current_user.photos,
      status: 200,
      errors: []
    }
    respond_with @response
  end

end