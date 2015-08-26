class CreateUnitTypes < ActiveRecord::Migration
  def change
    create_table :unit_types do |t|
      t.string :name
      t.string :abbreviation
      t.float :value
      t.string :metric_system
      t.boolean :base

      t.timestamps null: false
    end
  end
end
