class CreateUnitConversions < ActiveRecord::Migration
  def change
    create_table :unit_conversions do |t|
      t.integer :unit_type_id
      t.string :convert_to
      t.float :value

      t.timestamps null: false
    end
  end
end
