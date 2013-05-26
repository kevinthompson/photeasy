class CreatePrints < ActiveRecord::Migration
  def change
    create_table :prints do |t|
      t.string :size
      t.integer :photo_id
      t.integer :order_id
      t.integer :quantity

      t.timestamps
    end
  end
end
