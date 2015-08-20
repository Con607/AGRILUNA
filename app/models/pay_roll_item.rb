class PayRollItem < ActiveRecord::Base
	belongs_to :pay_roll
	belongs_to :employee
	has_many :assistances, dependent: :nullify

	validates_presence_of :discounts, on: :update_discount
	validates :discounts, numericality: { greater_than: -1 }

	validates_presence_of :bonuses, on: :update_bonus
	validates :bonuses, numericality: { greater_than: -1 }
end
