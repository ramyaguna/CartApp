class CreateOrder < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.string :namestring

      t.timestamps
    end
  end
end
