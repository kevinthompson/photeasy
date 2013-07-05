class API::V1::PhotosController < API::V1::BaseController
  before_filter :authenticate_user!

  def index
    respond_to_api current_user.photos
  end

end