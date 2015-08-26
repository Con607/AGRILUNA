class CreateOperatingCosts < ActiveRecord::Migration
  def change
    create_table :operating_costs do |t|
      t.integer :greenhouse_id
      t.date :event_date
      t.string :concept
      t.string :display
      t.float :unit_price
      t.integer :quantity
      t.float :total

      t.timestamps null: false
    end
  end
end
