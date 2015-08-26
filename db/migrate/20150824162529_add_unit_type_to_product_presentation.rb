class AddUnitTypeToProductPresentation < ActiveRecord::Migration
  def change
  	add_column :product_presentations, :unit_type_id, :integer
  	add_column :unit_types, :product_presentation_ids, :integer
  end
end
