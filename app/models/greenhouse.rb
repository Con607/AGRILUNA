class Greenhouse < ActiveRecord::Base
	belongs_to :company
	has_many :greenhouse_employees
	has_many :employees, through: :greenhouse_employees
	has_many :applications
	has_many :fertigations
	has_many :operating_costs
	has_many :administration_costs
	has_many :product_application_buys
	has_many :leachates
	has_many :environmental_conditions
	has_many :cycles
	has_many :pay_rolls
	has_many :sales
	has_many :harvests
end
