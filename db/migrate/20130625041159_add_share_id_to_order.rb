class AddShareIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :share_id, :integer
  end
end
