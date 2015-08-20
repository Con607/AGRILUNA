class AddAssistancesPayRollItemsAssociation < ActiveRecord::Migration
  def change
  	rename_column :pay_roll_items, :assistances, :total_assistances
  	add_column :assistances, :pay_roll_item_id, :integer
  	add_column :pay_roll_items, :assistance_ids, :integer
  end
end
