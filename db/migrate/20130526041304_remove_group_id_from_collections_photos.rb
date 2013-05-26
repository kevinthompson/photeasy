class RemoveGroupIdFromCollectionsPhotos < ActiveRecord::Migration
  def up
    remove_column :collections_photos, :group_id
    remove_column :collections_photos, :user_id
    add_column :collections_photos, :collection_id, :integer
    add_column :collections_photos, :photo_id, :integer
  end

  def down
    remove_column :collections_photos, :collection_id
    remove_column :collections_photos, :photo_id
    add_column :collections_photos, :group_id, :integer
    add_column :collections_photos, :user_id, :integer
  end
end
