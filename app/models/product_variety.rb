class ProductVariety < ActiveRecord::Base
	belongs_to :product
	has_many :harvests
	has_many :selections
	has_many :sales
end
