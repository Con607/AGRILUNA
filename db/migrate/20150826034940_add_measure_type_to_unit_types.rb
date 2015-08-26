class AddMeasureTypeToUnitTypes < ActiveRecord::Migration
  def change
  	add_column :unit_types, :measure_type, :string
  end
end
