class Leachate < ActiveRecord::Base
	belongs_to :phenological_stage
	belongs_to :greenhouse
end
