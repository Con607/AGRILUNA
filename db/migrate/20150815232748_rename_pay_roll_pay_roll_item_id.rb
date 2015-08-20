class RenamePayRollPayRollItemId < ActiveRecord::Migration
  def change
  	rename_column :pay_rolls, :pay_roll_item_id, :pay_roll_item_ids
  end
end
