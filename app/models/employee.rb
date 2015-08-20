class Employee < ActiveRecord::Base
	belongs_to :job_position
	has_many :greenhouse_employees
	has_many :greenhouses, through: :greenhouse_employees
	has_many :assistances
	has_many :pay_roll_items
end
