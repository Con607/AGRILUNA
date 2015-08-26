class Fertigation < ActiveRecord::Base
	belongs_to :greenhouse
	has_many :fertigation_items
end
