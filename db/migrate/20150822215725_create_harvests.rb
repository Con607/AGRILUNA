class CreateHarvests < ActiveRecord::Migration
  def change
    create_table :harvests do |t|
      t.date :event_date
      t.integer :greenhouse_id
      t.integer :product_id
      t.integer :product_variety_id
      t.integer :product_presentation_id
      t.float :product_quantity
      t.float :total_harvested

      t.timestamps null: false
    end
  end
end
