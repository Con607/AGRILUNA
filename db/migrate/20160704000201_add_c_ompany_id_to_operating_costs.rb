class AddCOmpanyIdToOperatingCosts < ActiveRecord::Migration
  def change
  	add_column :companies, :operating_cost_ids, :integer
  	add_column :operating_costs, :company_id, :integer
  end
end
