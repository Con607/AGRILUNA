class AddCompanyIdToProductionApplicationBuys < ActiveRecord::Migration
  def change
  	add_column :companies, :product_application_buy_ids, :integer
  	add_column :product_application_buys, :company_id, :integer
  end
end
