class Api::V1::PhotosController < Api::V1::BaseController
  before_filter :authenticate_user!

  def index
    respond_to do |format|
      format.json { render json: current_user.photos, meta: [], meta_key: :errors }
    end
  end

end