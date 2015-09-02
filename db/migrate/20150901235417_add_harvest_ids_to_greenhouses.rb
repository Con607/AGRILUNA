class AddHarvestIdsToGreenhouses < ActiveRecord::Migration
  def change
  	add_column :greenhouses, :harvest_ids, :integer
  end
end
