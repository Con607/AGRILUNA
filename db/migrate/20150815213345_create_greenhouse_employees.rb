class CreateGreenhouseEmployees < ActiveRecord::Migration
  def change
    create_table :greenhouse_employees do |t|
      t.integer :greenhouse_id
      t.integer :employee_id

      t.timestamps
    end
  end
end
