class Sale < ActiveRecord::Base
	belongs_to :greenhouse
	belongs_to :product_variety
	belongs_to :product_presentation
	belongs_to :product
	has_many :sale_items
end
