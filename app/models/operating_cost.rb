class OperatingCost < ActiveRecord::Base
	belongs_to :greenhouse
	belongs_to :company

	has_attached_file :image1, styles: { :big => "650x550", :front => "581x326", medium: "300x300>", thumb: "100x100>" }, 
								default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image1, content_type: /\Aimage\/.*\Z/
end
