class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.date :event_date
      t.integer :poduct_id
      t.integer :product_variety_id
      t.integer :product_presentation_id
      t.float :total_price
      t.string :status
      t.integer :sale_item_ids

      t.timestamps null: false
    end
  end
end
