class ApplicationProductBuysAssociations < ActiveRecord::Migration
  def change
  	add_column :greenhouses, :application_product_buy_ids, :integer
  	add_column :application_products, :application_product_buy_ids, :integer
  end
end
