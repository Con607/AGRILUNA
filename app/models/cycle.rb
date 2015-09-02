class Cycle < ActiveRecord::Base
	belongs_to :greenhouse

	scope :active, -> { where(active: true) }

end
