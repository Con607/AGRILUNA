class AddCompanyToAdministrationCosts < ActiveRecord::Migration
  def change
  	add_column :companies, :administration_cost_ids, :integer
  	add_column :administration_costs, :company_id, :integer
  end
end
