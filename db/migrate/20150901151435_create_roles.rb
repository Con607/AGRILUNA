class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :company_id
      t.integer :user_ids
      t.string :name
      t.text :description
      t.integer :role_permission_ids

      t.timestamps null: false
    end
  end
end
