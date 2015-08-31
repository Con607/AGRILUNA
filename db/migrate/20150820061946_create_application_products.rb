class CreateApplicationProducts < ActiveRecord::Migration
  def change
    create_table :application_products do |t|
      t.integer :application_item_ids
      t.string :name
      t.text :description
      t.float :quantity_available
      t.string :units_of_measure
      t.float :total_cost
      t.float :unit_cost

      t.timestamps null: false
    end
  end
end
