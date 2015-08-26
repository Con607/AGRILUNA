class CreateLeachates < ActiveRecord::Migration
  def change
    create_table :leachates do |t|
      t.date :event_date
      t.integer :greenhouse_id
      t.float :ddt
      t.float :ph_nutritive_solution
      t.float :ce_nutritive_solution
      t.float :dropper_spending
      t.float :ph_leachate
      t.float :ce_leachate
      t.integer :irrigations
      t.integer :phenological_stage_id

      t.timestamps null: false
    end
  end
end
