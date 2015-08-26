class ProductPresentation < ActiveRecord::Base
	belongs_to :product
	belongs_to :unit_type
	has_many :harvests
	has_many :selections
	has_many :sales
end
