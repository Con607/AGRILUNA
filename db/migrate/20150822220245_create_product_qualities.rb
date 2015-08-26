class CreateProductQualities < ActiveRecord::Migration
  def change
    create_table :product_qualities do |t|
      t.string :name
      t.string :description
      t.integer :selection_item_ids
      t.integer :sale_item_ids
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
