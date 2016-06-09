class AdministrationCost < ActiveRecord::Base
	belongs_to :company
	has_many :apportionment_per_greenhouses
end
