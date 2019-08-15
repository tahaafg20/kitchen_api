class AddAvailablityToChef < ActiveRecord::Migration[6.0]
  def change
    add_column :chefs, :available, :boolean, default: true
  end
end
