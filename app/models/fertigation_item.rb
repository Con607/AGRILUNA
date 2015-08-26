class FertigationItem < ActiveRecord::Base
	belongs_to :fertigation
	belongs_to :application_product
end
