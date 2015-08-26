class EnvironmentalCondition < ActiveRecord::Base
	belongs_to :environment
	belongs_to :weather
	belongs_to :greenhouse
end
