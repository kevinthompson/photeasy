class Api::V1::UsersController < Api::V1::BaseController
  respond_to :json

  def show
    params[:id] = current_user.id if user_signed_in? and params[:id] == 'current'
    respond_with User.find(params[:id])
  end

end