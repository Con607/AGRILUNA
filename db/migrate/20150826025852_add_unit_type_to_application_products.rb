class AddUnitTypeToApplicationProducts < ActiveRecord::Migration
  def change
  	remove_column :application_products, :units_of_measure, :string
  	add_column :application_products, :unit_type_id, :integer
  	add_column :unit_types, :application_product_ids, :integer
  end
end
