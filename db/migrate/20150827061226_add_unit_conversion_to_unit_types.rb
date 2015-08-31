class AddUnitConversionToUnitTypes < ActiveRecord::Migration
  def change
  	add_column :unit_types, :unit_converion_ids, :integer
  end
end
