class Api::V1::CollectionsController < Api::V1::BaseController
  respond_to :json

  def index
    respond_with({ data: current_user.collections, errors: [] })
  end

  def create
    collection = current_user.collections.new(params[:collection])
    collection.save if collection.valid?
    status_code = collection.errors.empty? ? 201 : 422
    respond_with({ data: collection, errors: collection.errors }, status: status_code, location: nil)
  end

  def show
    collection = current_user.collections.find(params[:id])
    respond_with({ data: collection, errors: collection.errors })
  end

  def update
    collection = current_user.collections.find(params[:id])
    collection.update_attributes(params[:collection]) if collection.valid?
    status_code = collection.errors.empty? ? 200 : 422
    respond_with({ data: collection, errors: collection.errors }, status: status_code, location: nil)
  end

  def destroy
    current_user.collections.where('id = ?', params[:id]).destroy_all
    respond_with({ data: {}, errors: [] })
  end

end