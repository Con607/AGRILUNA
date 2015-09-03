class SaleItem < ActiveRecord::Base
	belongs_to :product_quality
	belongs_to :sale

	validates :sale, :product_quality, :quantity, :unit_price, :status, presence: true

end
