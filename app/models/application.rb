class Application < ActiveRecord::Base
	belongs_to :greenhouse
	belongs_to :application_process
	has_many :application_items
end
