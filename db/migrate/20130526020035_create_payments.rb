class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :status
      t.integer :order_id

      t.timestamps
    end
  end
end
