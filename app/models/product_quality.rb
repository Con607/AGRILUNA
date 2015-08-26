class ProductQuality < ActiveRecord::Base
	belongs_to :product
	has_many :selection_items
	has_many :sale_items
end
