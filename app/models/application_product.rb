class ApplicationProduct < ActiveRecord::Base
	belongs_to :unit_type
	has_many :application_items, dependent: :nullify
	has_many :fertigation_items, dependent: :nullify
	has_many :product_application_buys, dependent: :nullify

	validates :name, :unit_type, presence: true
	validates :name, uniqueness: true

	def name_abbreviation
		"#{name} (#{unit_type.abbreviation})"
	end

	def name_quantity_available
		"#{name} (#{quantity_available} #{unit_type.abbreviation})"
	end
end
