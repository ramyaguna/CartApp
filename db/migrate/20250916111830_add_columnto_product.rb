class AddColumntoProduct < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :image, :string
  end
end
