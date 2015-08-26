class AddAdministrationCostsToGreenhouses < ActiveRecord::Migration
  def change
  	add_column :greenhouses, :administration_cost_ids, :integer
  end
end
