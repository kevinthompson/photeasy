class API::V1::SharesController < API::V1::BaseController

  def show
    share = Share.where(uuid: params[:id]).includes(:album, :user).first
    respond_to_api share
  end

end