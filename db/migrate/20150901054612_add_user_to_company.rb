class AddUserToCompany < ActiveRecord::Migration
  def change
  	add_column :users, :company_ids, :integer
  	add_column :companies, :user_ids, :integer
  end
end
