class ApplicationProduct < ActiveRecord::Base
	has_many :application_items
end
