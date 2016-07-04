class ProductApplicationBuy < ActiveRecord::Base
	belongs_to :supplier
	belongs_to :application_product
	belongs_to :unit_type
	belongs_to :company

	#validate :check_measure_type
	validates :buy_date, :application_product, :quanity, 
				:unit_cost, :total_cost, :supplier, :unit_type, presence: true

	has_attached_file :image1, styles: { :big => "650x550", :front => "581x326", medium: "300x300>", thumb: "100x100>" }, 
								:url => "/public/assets/images/properties/:style/:filename", 
								:path => ":rails_root/public/assets/images/properties/:style/:filename",
								:default_url => "/public/assets/images/:style/missing.png"
  	validates_attachment_content_type :image1, content_type: /\Aimage\/.*\Z/

	def check_measure_type
		application_product = ApplicationProduct.find(application_product_id)
		unit_type = UnitType.find(unit_type_id)
		if application_product.unit_type.measure_type != unit_type.measure_type
			#puts 'inside check_measure_type!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
			errors.add(:unit_type, "has different measure type than the selected product in inventory")
		end
	end
end
