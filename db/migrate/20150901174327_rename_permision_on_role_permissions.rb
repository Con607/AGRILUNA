class RenamePermisionOnRolePermissions < ActiveRecord::Migration
  def change
  	rename_column :role_permissions, :permision_id, :permission_id
  end
end
