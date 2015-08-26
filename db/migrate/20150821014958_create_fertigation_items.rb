class CreateFertigationItems < ActiveRecord::Migration
  def change
    create_table :fertigation_items do |t|
      t.integer :fertigation_id
      t.integer :application_product_id
      t.string :unit_measure
      t.float :fertilizer_quantity
      t.float :h20_quantity
      t.float :concentration
      t.float :injection_rate
      t.float :fertilizer_cost_per_unit
      t.float :cost

      t.timestamps null: false
    end
  end
end
