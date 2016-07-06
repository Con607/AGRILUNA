class Receipe < ActiveRecord::Base
	belongs_to :company
	belongs_to :greenhouse
	

	has_attached_file :document1, styles: { :big => "650x550", :front => "581x326", medium: "300x300>", thumb: "100x100>" },
								:url => "/public/assets/pdfs/receipes/:style/:filename", 
								:path => ":rails_root/public/assets/pdfs/receipes/:style/:filename",
								:default_url => "/public/assets/pdfs/:style/missing.png"

  	validates_attachment :document1, :content_type => { :content_type => "application/pdf" }#, 
  										#:size => { :in => 0..5.megabytes }
  	before_post_process :document1
end
