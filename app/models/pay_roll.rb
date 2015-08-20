class PayRoll < ActiveRecord::Base
	has_many :pay_roll_items, dependent: :destroy
end
