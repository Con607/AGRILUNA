class CreateEnvironments < ActiveRecord::Migration
  def change
    create_table :environments do |t|
      t.string :name
      t.text :description
      t.integer :environmental_condition_ids

      t.timestamps null: false
    end
  end
end
