class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :tip
      t.text :notes
      t.string :store
      t.datetime :delivery_time
      t.integer :buyer_id
      t.integer :shopper_id
      t.integer :grocery_list_id

      t.timestamps null: false
    end
  end
end
