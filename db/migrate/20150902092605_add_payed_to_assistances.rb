class AddPayedToAssistances < ActiveRecord::Migration
  def change
  	add_column :assistances, :payed, :boolean
  end
end
