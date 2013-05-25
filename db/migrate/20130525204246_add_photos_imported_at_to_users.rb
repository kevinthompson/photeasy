class AddPhotosImportedAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :photos_imported_at, :datetime
  end
end
