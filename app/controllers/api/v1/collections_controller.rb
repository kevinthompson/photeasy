class Api::V1::CollectionsController < Api::V1::BaseController
  respond_to :json

  def index
    response_hash = {
      data: current_user.collections,
      errors: []
    }
    respond_with response_hash
  end

  def create
    response_hash = {}
    collection = current_user.collections.new(params[:collection])
    collection.save if collection.valid?
    response_hash[:errors] = collection.errors
    response_hash[:data] = collection
    respond_with response_hash, location: nil
  end

  def show
    collection = current_user.collections.find(params[:id])
    response_hash = {
      data: collection,
      errors: []
    }
    respond_with response_hash
  end

  def update
    collection = current_user.collections.find(params[:id])
    collection.update_attributes(params[:collection])
    response_hash = {
      data: collection,
      errors: collection.errors
    }
  end

  def destroy
    current_user.collections.where('id = ?', params[:id]).destroy_all
  end

end