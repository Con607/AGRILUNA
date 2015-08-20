class CreateGreenhouses < ActiveRecord::Migration
  def change
    create_table :greenhouses do |t|
      t.string :name
      t.string :description
      t.string :location
      t.integer :greenhouse_employee_ids

      t.timestamps
    end
  end
end
