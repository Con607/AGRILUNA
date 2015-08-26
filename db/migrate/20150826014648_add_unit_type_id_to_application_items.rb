class AddUnitTypeIdToApplicationItems < ActiveRecord::Migration
  def change
  	remove_column :application_items, :unit_of_measure, :string
  	add_column :application_items, :unit_type_id, :integer
  	add_column :unit_types, :application_item_ids, :integer
  end
end
