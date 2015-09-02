class Assistance < ActiveRecord::Base
	belongs_to :employee
	belongs_to :pay_roll_item

	validates :employee, :assistance_date, :assisted, presence: true

	scope :not_payed, -> { where(payed: [false, nil]) }
end
