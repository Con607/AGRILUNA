class PayRoll < ActiveRecord::Base
	belongs_to :greenhouse
	has_many :pay_roll_items, dependent: :destroy

	def start_date_end_date
		"#{pay_roll.start_date} | #{pay_roll.end_date}"
	end
end
