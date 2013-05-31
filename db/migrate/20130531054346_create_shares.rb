class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.datetime :disabled_at
      t.string :email
      t.integer :visits
      t.integer :album_id

      t.timestamps
    end

    add_index :shares, :album_id
  end
end
