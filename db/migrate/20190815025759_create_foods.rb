class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :cooking_time
      t.timestamps
    end
  end
end
