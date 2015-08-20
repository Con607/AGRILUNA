class GreenhouseEmployee < ActiveRecord::Base
	belongs_to :greenhouse
	belongs_to :employee
end
