class AddUnitTypeToProductApplicationBuys < ActiveRecord::Migration
  def change
  	remove_column :product_application_buys, :unit, :string
  	add_column :product_application_buys, :unit_type_id, :integer
  	add_column :unit_types, :product_application_buy_ids, :integer
  end
end
