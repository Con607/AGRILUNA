class CreateApportionmentPerGreenhouses < ActiveRecord::Migration
  def change
    create_table :apportionment_per_greenhouses do |t|
      t.date :event_date
      t.integer :administration_cost_id
      t.integer :greenhouse_id
      t.float :percentage
      t.float :amount

      t.timestamps null: false
    end
  end
end
