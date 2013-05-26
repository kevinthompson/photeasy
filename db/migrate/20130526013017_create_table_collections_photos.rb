class CreateTableCollectionsPhotos < ActiveRecord::Migration
  def up
    create_table :collections_photos, id: false do |t|
      t.integer :group_id
      t.integer :user_id
    end
  end

  def down
    drop_table :collections_photos
  end
end
