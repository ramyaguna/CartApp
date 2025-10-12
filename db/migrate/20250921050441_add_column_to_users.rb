class AddColumnToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :name, :string
    add_column :users, :is_admin, :boolean
  end
end
