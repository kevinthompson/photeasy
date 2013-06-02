class AddUuidToShares < ActiveRecord::Migration
  def change
    add_column :shares, :uuid, :string, null: false
    add_index :shares, :uuid, unique: true
  end
end
