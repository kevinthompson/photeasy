class AddAttachmentThumbnailToPhotos < ActiveRecord::Migration
  def self.up
    change_table :photos do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    drop_attached_file :photos, :thumbnail
  end
end
