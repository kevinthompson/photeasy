class API::V1::UsersController < API::V1::BaseController
  before_filter :authenticate_user!

  def show
    params[:id] = current_user.id if user_signed_in? and params[:id] == 'current'
    user = User.find(params[:id])
    respond_to_api user
  end

end