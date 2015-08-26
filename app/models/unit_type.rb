class UnitType < ActiveRecord::Base
	has_many :product_presentations
	has_many :application_items
	has_many :application_products
	has_many :product_application_buys
end
