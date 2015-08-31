class CreateCycles < ActiveRecord::Migration
  def change
    create_table :cycles do |t|
      t.integer :greenhouse_id
      t.string :name
      t.date :start_date
      t.date :end_date
      t.float :estimated_performance_per_m2
      t.float :greenhouse_estimated_performance
      t.float :maximum_estimated_production_cost
      t.float :expected_average_selling_price_per_kg
      t.float :expected_total_expenses
      t.float :expected_total_profit

      t.timestamps null: false
    end
  end
end
