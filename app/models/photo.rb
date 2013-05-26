class Photo < ActiveRecord::Base
  MIN_BYTE_SIZE = 1048576
  IMAGE_SIZES = %w[small medium large]

  attr_accessible :filename, :provider, :provider_id, :url, :user_id

  belongs_to :user
  has_and_belongs_to_many :collections

  validates :provider, :provider_id, :user_id, presence: true
  validates :provider_id, uniqueness: { scope: [:provider, :user_id] }

  def as_json
    {
      id: id,
      filename: filename,
      images: image_urls
    }
  end

  def thumbnail(size = :medium)
    raise ArgumentError unless IMAGE_SIZES.include?(size)
    user.dropbox.client.raw.thumbnails({ path: url, size: size[0] })
  end

  def image_urls
    @image_urls ||= begin
      image_urls = {}
      IMAGE_SIZES.map do |size|
        image_urls[size] = Rails.application.routes.url_helpers.photo_thumbnail_path(photo_id: id, size: size)
      end
      image_urls
    end
  end

end
