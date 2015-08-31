class UnitType < ActiveRecord::Base
	has_many :product_presentations
	has_many :application_items
	has_many :application_products
	has_many :product_application_buys
	has_many :unit_conversions
	has_many :fertigation_items

	def convert_to(quantity, convert_to)
		puts "!!!!!!!!!!!!!!!!!!!!!!
				Inside convert_to method:
				quantity = #{quantity}
				convert_to = #{convert_to}
				!!!!!!!!!!!!!!!!!!!11111"
		conversion = self.unit_conversions.where(convert_to: convert_to).first
		puts "!!!!! value = #{conversion.value}"
		converted = quantity * conversion.value
		return converted
	end

	def name_abbreviation
		"#{name} (#{abbreviation})"
	end
end
