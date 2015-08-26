class CreateSaleItems < ActiveRecord::Migration
  def change
    create_table :sale_items do |t|
      t.integer :sale_id
      t.integer :product_quality_id
      t.integer :quantity
      t.float :unit_price
      t.float :total_price
      t.string :status

      t.timestamps null: false
    end
  end
end
