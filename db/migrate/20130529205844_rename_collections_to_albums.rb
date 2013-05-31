class RenameCollectionsToAlbums < ActiveRecord::Migration
  def change
    rename_column :orders, :collection_id, :album_id
    rename_table :collections, :albums

    rename_column :collections_photos, :collection_id, :album_id
    rename_table :collections_photos, :albums_photos
  end
end
