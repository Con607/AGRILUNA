class CreateJobPositions < ActiveRecord::Migration
  def change
    create_table :job_positions do |t|
      t.string :name
      t.string :description
      t.integer :employee_ids

      t.timestamps
    end
  end
end
