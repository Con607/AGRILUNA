class FertigationItem < ActiveRecord::Base
	belongs_to :fertigation
	belongs_to :application_product
	belongs_to :unit_type
end
