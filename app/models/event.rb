class Event < ActiveRecord::Base
	belongs_to :company
	belongs_to :greenhouse
end
