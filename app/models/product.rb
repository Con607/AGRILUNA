class Product < ActiveRecord::Base
	has_many :product_varieties
	has_many :product_presentations
	has_many :product_qualities
	has_many :harvests
	has_many :sales
	has_many :selections
end
