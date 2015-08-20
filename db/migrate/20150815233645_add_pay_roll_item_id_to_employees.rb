class AddPayRollItemIdToEmployees < ActiveRecord::Migration
  def change
  	add_column :employees, :pay_roll_item_ids, :integer
  end
end
