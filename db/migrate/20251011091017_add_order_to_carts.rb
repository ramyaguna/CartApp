class AddOrderToCarts < ActiveRecord::Migration[8.0]
  def change
    add_reference :carts, :order, null: false, foreign_key: true
  end
end
