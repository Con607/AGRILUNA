class AddApportionmentPerGreenhouseIdToAdministrationCosts < ActiveRecord::Migration
  def change
  	add_column :administration_costs, :apportionment_per_greenhouse_ids, :integer
  end
end
