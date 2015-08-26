class CreateSelectionItems < ActiveRecord::Migration
  def change
    create_table :selection_items do |t|
      t.integer :selection_id
      t.integer :product_quality_id
      t.float :quantity

      t.timestamps null: false
    end
  end
end
