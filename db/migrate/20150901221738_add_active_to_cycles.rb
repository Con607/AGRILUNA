class AddActiveToCycles < ActiveRecord::Migration
  def change
  	add_column :cycles, :active, :boolean
  end
end
