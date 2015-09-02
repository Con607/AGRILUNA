class RenameRoleIdOnUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :role_id, :user_role_ids
  	rename_column :roles, :user_ids, :user_role_ids
  end
end
