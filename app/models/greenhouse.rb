class Greenhouse < ActiveRecord::Base
	has_many :greenhouse_employees
	has_many :employees, through: :greenhouse_employees
end
