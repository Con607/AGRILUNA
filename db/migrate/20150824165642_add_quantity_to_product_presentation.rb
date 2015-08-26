class AddQuantityToProductPresentation < ActiveRecord::Migration
  def change
  	add_column :product_presentations, :quantity, :integer
  end
end
