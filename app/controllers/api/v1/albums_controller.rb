class API::V1::AlbumsController < API::V1::BaseController
  before_filter :authenticate_user!

  def index
    respond_to do |format|
      format.json { render json: current_user.albums, meta: [], meta_key: :errors }
    end
  end

  def create
    album = current_user.albums.new(album_params)
    album.save if album.valid?
    status_code = album.errors.empty? ? :created : :unprocessable_entity
    respond_to do |format|
      format.json { render json: album, meta: album.errors, meta_key: :errors, status: status_code, location: nil }
    end
  end

  def show
    album = current_user.albums.find(params[:id])
    respond_to do |format|
      format.json { render json: album, meta: album.errors, meta_key: :errors }
    end
  end

  def update
    album = current_user.albums.find(params[:id])
    album.update_attributes(album_params) if album.valid?
    status_code = album.errors.empty? ? :ok : :unprocessable_entity
    respond_to do |format|
      format.json { render json: album, meta: album.errors, meta_key: :errors, status: status_code }
    end
  end

  def destroy
    current_user.albums.where('id = ?', params[:id]).destroy_all
    respond_to do |format|
      format.json { render json: { data: {}, errors: [] } }
    end
  end

  private

  def album_params
    params.permit(:auth_token)
    params.required(:album).permit(:name, { photo_ids: [] }, { shares_attributes: [:email] })
  end

end