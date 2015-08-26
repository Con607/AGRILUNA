class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.date :event_date
      t.integer :greenhouse_id
      t.integer :product_id
      t.integer :product_variety_id
      t.integer :product_presentation_id
      t.float :total_weight
      t.integer :selection_item_ids

      t.timestamps null: false
    end
  end
end
