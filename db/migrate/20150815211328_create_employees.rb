class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :second_name
      t.string :last_name
      t.string :second_last_name
      t.float :salary
      t.integer :greenhouse_employee_ids
      t.integer :job_position_id
      t.integer :pay_roll_item_ids

      t.timestamps
    end
  end
end
