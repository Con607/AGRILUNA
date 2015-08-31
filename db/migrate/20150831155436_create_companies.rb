class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.text :address
      t.string :telephone
      t.integer :greenhouse_ids

      t.timestamps null: false
    end
  end
end
