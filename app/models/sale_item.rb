class SaleItem < ActiveRecord::Base
	belongs_to :product_quality
	belongs_to :sale
end
