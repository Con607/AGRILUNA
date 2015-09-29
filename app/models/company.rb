class Company < ActiveRecord::Base
	has_many :greenhouses
	has_many :user_companies
	has_many :users, through: :user_companies
	has_many :roles
	has_many :administration_costs
end
