class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.integer :role_permission_ids
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
