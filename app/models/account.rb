class Account < ActiveRecord::Base
	belongs_to :user
	has_one :plan

	validates :user_id, presence: true, numericality: { only_integer: true }
end
