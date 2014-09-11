class Hotel < ActiveRecord::Base
	#attr_accessible :photo, :hotels
	has_one :address
	has_attached_file :photo, :styles => {:small => "150x150>"},
					  :url => "/assets/hotels/:id/:style/:basename.:extension",
					  :path => ":rails_root/public/assets/hotels/:id/:style/:basename.:extension"
end
