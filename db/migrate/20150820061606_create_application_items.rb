class CreateApplicationItems < ActiveRecord::Migration
  def change
    create_table :application_items do |t|
      t.integer :application_id
      t.integer :application_product_id
      t.string :unit_of_measure
      t.float :quantity
      t.float :h2o_quantity_liters
      t.float :total_product_used
      t.float :cost_per_unit
      t.float :total_cost

      t.timestamps null: false
    end
  end
end
