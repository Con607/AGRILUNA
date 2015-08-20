class CreateAssistances < ActiveRecord::Migration
  def change
    create_table :assistances do |t|
      t.integer :employee_id
      t.date :assistance_date
      t.boolean :assisted
      t.integer :pay_roll_item_id

      t.timestamps
    end
  end
end
