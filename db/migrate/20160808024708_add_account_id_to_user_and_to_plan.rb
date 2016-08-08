class AddAccountIdToUserAndToPlan < ActiveRecord::Migration
  def change
  	add_column :users, :account_id, :integer
  	add_column :plans, :account_id, :integer
  end
end
