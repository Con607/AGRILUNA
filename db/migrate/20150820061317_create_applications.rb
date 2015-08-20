class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.date :application_date
      t.integer :application_process_id
      t.text :purpose
      t.integer :greenhouse_id
      t.integer :application_item_ids
      t.float :application_cost

      t.timestamps null: false
    end
  end
end
