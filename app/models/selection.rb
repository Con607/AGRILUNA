class Selection < ActiveRecord::Base
	belongs_to :greenhouse
	belongs_to :product
	belongs_to :product_variety
	belongs_to :product_presentation
	has_many :selection_items
end
