class Company < ActiveRecord::Base
	has_many :greenhouses
	has_many :user_companies
	has_many :users, through: :user_companies
	#has_many :roles
	has_many :administration_costs
	has_many :product_application_buys
	has_many :operating_costs
	has_many :receipes
	has_many :events

	validates :name, presence: true, uniqueness: true
	validates :description, presence: true
	validates :address, presence: true
	validates :telephone, presence: true, numericality: { only_integer: true }

	def self.by_current_user(user)
	  where(user_ids: user)
	end

end
