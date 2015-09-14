class ChangeQuantityToFloatOnProductApplicationBuys < ActiveRecord::Migration
  def change
  	change_column :product_application_buys, :quanity, :float
  end
end
