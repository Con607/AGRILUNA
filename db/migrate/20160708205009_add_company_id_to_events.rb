class AddCompanyIdToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :company_id, :integer
  	add_column :companies, :event_ids, :integer
  	add_column :greenhouses, :event_ids, :integer
  	add_column :events, :greenhouse_id, :integer
  end
end
