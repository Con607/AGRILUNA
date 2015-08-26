class ApplicationItem < ActiveRecord::Base
	belongs_to :application
	belongs_to :application_product
	belongs_to :unit_type
end
