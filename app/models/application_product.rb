class ApplicationProduct < ActiveRecord::Base
	belongs_to :unit_type
	has_many :application_items
	has_many :fertigation_items
	has_many :product_application_buys
end
