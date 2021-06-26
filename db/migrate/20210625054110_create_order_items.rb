class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :item_id,    null: false
      t.integer :order_id,   null: false
      t.integer :price,      null: false
      t.integer :amount,     null: false
      t.integer :status,     null: false, default: 0
      t.timestamps null: false, default: ->{"CURRENT_TIMESTAMP"}
    end
  end
end
