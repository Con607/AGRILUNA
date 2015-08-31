class AddCycleAndCompanyToGreenhouses < ActiveRecord::Migration
  def change
  	add_column :greenhouses, :company_id, :integer
  	add_column :greenhouses, :cycle_ids, :integer
  end
end
