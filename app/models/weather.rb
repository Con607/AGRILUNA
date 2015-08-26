class Weather < ActiveRecord::Base
	has_many :environmental_conditions
end
