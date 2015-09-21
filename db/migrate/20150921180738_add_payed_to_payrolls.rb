class AddPayedToPayrolls < ActiveRecord::Migration
  def change
  	add_column :pay_rolls, :payed, :boolean
  end
end
