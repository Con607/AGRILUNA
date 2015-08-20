class CreateApplicationProcesses < ActiveRecord::Migration
  def change
    create_table :application_processes do |t|
      t.integer :application_ids
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
