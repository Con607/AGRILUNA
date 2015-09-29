class RemoveGreenhouseFromAdministrationCost < ActiveRecord::Migration
  def change
  	remove_column :greenhouses, :administration_cost_ids, :integer
  	remove_column :administration_costs, :greenhouse_id, :integer
  end
end
