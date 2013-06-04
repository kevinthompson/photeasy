class Photo < ActiveRecord::Base
  MIN_BYTE_SIZE = 1048576
  IMAGE_SIZES = %w[small large]

  attr_accessible :filename, :provider, :provider_id, :thumbnail, :url, :user_id
  has_attached_file :thumbnail, styles: { small: '256x256#', large: '1024x1024>' }

  belongs_to :user
  has_many :prints
  has_many :shares, through: :albums
  has_and_belongs_to_many :albums

  validates :provider, :provider_id, :user_id, presence: true
  validates :provider_id, uniqueness: { scope: [:provider, :user_id] }

  def images
    @images ||= begin
      image_urls = {}
      IMAGE_SIZES.map do |size|
        image_urls[size] = thumbnail.url(size)
      end
      image_urls
    end
  end

  # TODO: Move this logic out of Photo. PhotoImporter?
  def import_thumbnail
    image = Tempfile.new("thumbnail_#{provider_id}")
    image.binmode
    image_data = user.dropbox.client.raw.thumbnails({ path: url, size: :xl })
    image.write(image_data)
    self.update_attribute(:thumbnail, image)
    image.close
    image.unlink
  end

end
