class AddLeachatesToGreenhouses < ActiveRecord::Migration
  def change
  	add_column :greenhouses, :leachate_ids, :integer
  end
end
