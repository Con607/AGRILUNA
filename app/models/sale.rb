class Sale < ActiveRecord::Base
	belongs_to :greenhouse
	belongs_to :product_variety
	belongs_to :product_presentation
	belongs_to :product
	has_many :sale_items

	validates :event_date, :greenhouse, :product, :product_variety, :product_presentation, presence: true

end
