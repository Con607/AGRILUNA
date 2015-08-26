class CreateProductPresentations < ActiveRecord::Migration
  def change
    create_table :product_presentations do |t|
      t.string :name
      t.string :description
      t.integer :harvest_ids
      t.integer :selection_ids
      t.integer :sale_ids
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
