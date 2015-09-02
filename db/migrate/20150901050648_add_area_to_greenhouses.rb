class AddAreaToGreenhouses < ActiveRecord::Migration
  def change
  	add_column :greenhouses, :area, :integer
  end
end
