class CreateOrderFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :order_foods do |t|
      t.integer :food_id
      t.boolean :status
      t.integer :order_id
      t.integer :quantity

      t.timestamps
    end
  end
end
