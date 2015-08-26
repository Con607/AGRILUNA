class CreateFertigations < ActiveRecord::Migration
  def change
    create_table :fertigations do |t|
      t.integer :greenhouse_id
      t.datetime :fertigation_datetime
      t.string :tank
      t.integer :fertigation_item_ids
      t.float :total_cost

      t.timestamps null: false
    end
  end
end
