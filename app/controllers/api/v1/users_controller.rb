class Api::V1::UsersController < Api::V1::BaseController
  respond_to :json

  def show
    params[:id] = current_user.id if user_signed_in? and params[:id] == 'current'
    user = User.find(params[:id])
    respond_to do |format|
      format.json { render json: user, meta: [], meta_key: :errors }
    end
  end

end