class CreatePhenologicalStages < ActiveRecord::Migration
  def change
    create_table :phenological_stages do |t|
      t.string :name
      t.string :description
      t.integer :leachate_ids

      t.timestamps null: false
    end
  end
end
