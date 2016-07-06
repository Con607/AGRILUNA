class CreateReceipes < ActiveRecord::Migration
  def change
    create_table :receipes do |t|
      t.integer :company_id
      t.integer :greenhouse_id
      t.date :date

      t.timestamps null: false
    end
  end
end
