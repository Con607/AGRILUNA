class ChangePoductIdOnSales < ActiveRecord::Migration
  def change
  	rename_column :sales, :poduct_id, :product_id
  end
end
