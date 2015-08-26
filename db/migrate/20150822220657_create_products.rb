class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :product_variety_ids
      t.integer :product_presentation_ids
      t.integer :product_quality_ids
      t.integer :harvest_ids
      t.integer :selection_ids
      t.integer :sale_ids

      t.timestamps null: false
    end
  end
end
