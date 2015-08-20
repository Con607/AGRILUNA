class CreatePayRollItems < ActiveRecord::Migration
  def change
    create_table :pay_roll_items do |t|
      t.integer :pay_roll_id
      t.integer :employee_id
      t.integer :total_assistances
      t.float :salary
      t.float :discounts
      t.float :bonuses
      t.float :total
      t.integer :assistance_ids

      t.timestamps
    end
  end
end
