class ChangeUnitMeasureFromFertigationItems < ActiveRecord::Migration
  def change
  	remove_column :fertigation_items, :unit_measure, :string
  	add_column :fertigation_items, :unit_type_id, :integer
  	add_column :unit_types, :fertigation_item_ids, :integer
  end
end
