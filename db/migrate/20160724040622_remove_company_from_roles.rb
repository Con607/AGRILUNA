class RemoveCompanyFromRoles < ActiveRecord::Migration
  def change
  	remove_column :roles, :company_id, :integer
  end
end
