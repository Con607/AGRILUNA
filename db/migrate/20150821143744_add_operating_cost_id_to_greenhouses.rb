class AddOperatingCostIdToGreenhouses < ActiveRecord::Migration
  def change
  	add_column :greenhouses, :operating_cost_ids, :integer
  end
end
