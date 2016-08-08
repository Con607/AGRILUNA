class Plan < ActiveRecord::Base
	belongs_to :account
	has_many :users
	has_many :companies
	has_many :greenhouses
	
end
