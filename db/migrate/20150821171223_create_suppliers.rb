class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.text :description
      t.string :telephone
      t.string :celphone
      t.string :address
      t.string :contact_name
      t.string :email
      t.integer :product_application_buy_ids

      t.timestamps null: false
    end
  end
end
