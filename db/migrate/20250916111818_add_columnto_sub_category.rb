class AddColumntosub_category < ActiveRecord::Migration[8.0]
  def change
    add_column :sub_categories, :image, :string
  end
end
