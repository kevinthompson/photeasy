class AddImportingPhotosToUser < ActiveRecord::Migration
  def change
    add_column :users, :importing_photos, :boolean, default: false
  end
end
