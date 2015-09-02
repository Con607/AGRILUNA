class AddGreenhouseToPayRoll < ActiveRecord::Migration
  def change
  	add_column :pay_rolls, :greenhouse_id, :integer
  	add_column :greenhouses, :pay_roll_ids, :integer
  end
end
