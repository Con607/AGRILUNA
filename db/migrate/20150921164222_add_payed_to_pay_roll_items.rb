class AddPayedToPayRollItems < ActiveRecord::Migration
  def change
  	add_column :pay_roll_items, :payed, :boolean
  end
end
