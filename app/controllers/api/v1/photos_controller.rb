class Api::V1::PhotosController < Api::V1::BaseController

  def index
    respond_to do |format|
      format.json { render json: current_user.photos, meta: [], meta_key: :errors }
    end
  end

end