class Harvest < ActiveRecord::Base
	belongs_to :greenhouse
	belongs_to :product
	belongs_to :product_variety
	belongs_to :product_presentation
end
