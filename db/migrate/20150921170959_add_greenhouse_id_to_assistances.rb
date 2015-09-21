class AddGreenhouseIdToAssistances < ActiveRecord::Migration
  def change
  	add_column :greenhouses, :assistance_ids, :integer
  end
end
