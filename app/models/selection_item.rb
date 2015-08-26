class SelectionItem < ActiveRecord::Base
	belongs_to :product_quality
	belongs_to :selection
end
