class Assistance < ActiveRecord::Base
	belongs_to :employee
	belongs_to :pay_roll_item
	belongs_to :greenhouse

	validates :greenhouse, :employee, :assistance_date, :assisted, presence: true

	scope :not_payed, -> { where(payed: [false, nil]) }
end
