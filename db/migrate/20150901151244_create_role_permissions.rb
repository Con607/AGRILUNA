class CreateRolePermissions < ActiveRecord::Migration
  def change
    create_table :role_permissions do |t|
      t.integer :role_id
      t.integer :permision_id

      t.timestamps null: false
    end
  end
end
