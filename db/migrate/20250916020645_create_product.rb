class CreateProduct < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.references :sub_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
