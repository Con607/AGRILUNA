class AddReceipeIdToCompanyAndGreenhouse < ActiveRecord::Migration
  def change
  	add_column :companies, :receipe_ids, :integer
  	add_column :greenhouses, :receipe_ids, :integer
  end
end
