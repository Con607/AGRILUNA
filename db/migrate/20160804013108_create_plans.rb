class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.integer :company_ids
      t.integer :greenhouse_ids
      t.integer :user_ids
      t.integer :users_allowed
      t.integer :companies_allowed
      t.integer :greenhouses_allowed
      t.float :cost_per_month_usd
      t.string :billing

      t.timestamps null: false
    end
  end
end
