class API::V1::AlbumsController < API::V1::BaseController
  before_filter :authenticate_user!

  def index
    respond_to_api current_user.albums
  end

  def create
    album = current_user.albums.new(album_params)
    album.save if album.valid?
    respond_to_api album, :created, location: nil
  end

  def show
    album = current_user.albums.find(params[:id])
    respond_to_api album
  end

  def update
    album = current_user.albums.find(params[:id])
    album.update_attributes(album_params) if album.valid?
    respond_to_api album
  end

  def destroy
    current_user.albums.where('id = ?', params[:id]).destroy_all
    respond_to_api
  end

  private

  def album_params
    params.permit(:auth_token)
    params.required(:album).permit(:name, { photo_ids: [] }, { shares_attributes: [:email] })
  end

end