class Supplier < ActiveRecord::Base
	has_many :product_applications
	has_many :product_application_buys
end
