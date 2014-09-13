class Rating < ActiveRecord::Base
	belongs_to :hotels,:foreign_key => :hotel_id
	
end
