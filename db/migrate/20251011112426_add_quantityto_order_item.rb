class AddQuantitytoOrderItem < ActiveRecord::Migration[8.0]
  def change
    add_column :order_items, :quantity, :integer
  end
end
