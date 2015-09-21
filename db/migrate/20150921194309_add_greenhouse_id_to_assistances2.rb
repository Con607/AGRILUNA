class AddGreenhouseIdToAssistances2 < ActiveRecord::Migration
  def change
  	add_column :assistances, :greenhouse_id, :integer
  end
end
