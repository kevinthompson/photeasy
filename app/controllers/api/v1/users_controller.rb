class Api::V1::UsersController < Api::V1::BaseController
  respond_to :json

  def index
    respond_with User.all
  end
end