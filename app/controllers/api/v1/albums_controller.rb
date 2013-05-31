class Api::V1::AlbumsController < Api::V1::BaseController

  def index
    respond_to do |format|
      format.json { render json: { data: current_user.albums, errors: [] } }
    end
  end

  def create
    album = current_user.albums.new(params[:album])
    album.save if album.valid?
    status_code = album.errors.empty? ? 201 : 422
    respond_to do |format|
      format.json { render json: { data: album, errors: album.errors }, status: status_code, location: nil }
    end
  end

  def show
    album = current_user.albums.find(params[:id])
    respond_to do |format|
      format.json { render json: { data: album, errors: album.errors } }
    end
  end

  def update
    album = current_user.albums.find(params[:id])
    album.update_attributes(params[:album]) if album.valid?
    status_code = album.errors.empty? ? 200 : 422
    respond_to do |format|
      format.json { render json: { data: album, errors: album.errors }, status: status_code }
    end
  end

  def destroy
    current_user.albums.where('id = ?', params[:id]).destroy_all
    respond_to do |format|
      format.json { render json: { data: {}, errors: [] } }
    end
  end

end