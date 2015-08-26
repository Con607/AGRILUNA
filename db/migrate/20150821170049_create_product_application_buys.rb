class CreateProductApplicationBuys < ActiveRecord::Migration
  def change
    create_table :product_application_buys do |t|
      t.integer :greenhouse_id
      t.date :buy_date
      t.integer :application_product_id
      t.string :unit
      t.integer :quanity
      t.float :unit_cost
      t.float :total_cost
      t.integer :supplier_id

      t.timestamps null: false
    end
  end
end
