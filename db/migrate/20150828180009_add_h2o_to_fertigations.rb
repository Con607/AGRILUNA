class AddH2oToFertigations < ActiveRecord::Migration
  def change
  	remove_column :fertigation_items, :h20_quantity, :float
  	add_column :fertigations, :h2o_quantity, :float
  end
end
