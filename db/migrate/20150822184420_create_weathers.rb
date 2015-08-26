class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.string :name
      t.text :description
      t.integer :environmental_condition_ids

      t.timestamps null: false
    end
  end
end
