class API::V1::SharesController < API::V1::BaseController
  before_filter :load_data, only: [:show]

  def show
    respond_to do |format|
      format.json { render json: @share, meta: [], meta_key: :errors }
    end
  end

  private

  def load_data
    @share = Share.where(uuid: params[:id]).includes(:album, :user).first
  end

end