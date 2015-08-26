class CreateEnvironmentalConditions < ActiveRecord::Migration
  def change
    create_table :environmental_conditions do |t|
      t.date :event_date
      t.integer :greenhouse_id
      t.integer :environment_id
      t.float :max_temp
      t.float :min_temp
      t.float :max_rel_humidity
      t.float :min_rel_humidity
      t.integer :weather_id

      t.timestamps null: false
    end
  end
end
