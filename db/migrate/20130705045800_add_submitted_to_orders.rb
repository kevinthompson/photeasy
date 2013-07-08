class AddSubmittedToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :submitted, :boolean
  end
end
