class CreatePayRolls < ActiveRecord::Migration
  def change
    create_table :pay_rolls do |t|
      t.integer :pay_roll_item_ids
      t.date :start_date
      t.date :end_date
      t.float :subtotal
      t.float :discount
      t.float :bonus
      t.float :total

      t.timestamps
    end
  end
end
