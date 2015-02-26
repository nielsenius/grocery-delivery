class CreateGroceryLists < ActiveRecord::Migration
  def change
    create_table :grocery_lists do |t|
      t.string :name
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
