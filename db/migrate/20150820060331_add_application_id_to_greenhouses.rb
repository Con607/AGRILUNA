class AddApplicationIdToGreenhouses < ActiveRecord::Migration
  def change
  	add_column :greenhouses, :application_ids, :integer
  end
end
