class CreateCarts < ActiveRecord::Migration[8.0]
  def change
    create_table :carts do |t|
      t.integer :quantity
      t.integer :price
      t.integer :total

      t.timestamps
    end
  end
end
