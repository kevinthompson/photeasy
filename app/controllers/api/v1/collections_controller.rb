class Api::V1::CollectionsController < Api::V1::BaseController
  respond_to :json

  def index
    @response = {
      data: current_user.collections,
      errors: []
    }
    respond_with @response
  end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end

end