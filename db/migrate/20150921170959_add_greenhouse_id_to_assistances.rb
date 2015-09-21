class AddGreenhouseIdToAssistances < ActiveRecord::Migration
  def change
  	#add_column :assistances, :greenhouse_id, :integer
  	add_column :greenhouses, :assistance_ids, :integer
  end
end
