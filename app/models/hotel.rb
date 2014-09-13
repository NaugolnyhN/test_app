class Hotel < ActiveRecord::Base
	#attr_accessible :photo, :hotels
	has_one :address
	has_many :rating
	has_attached_file :photo,
					  :url => "/assets/hotels/:id/:style/:basename.:extension",
					  :path => ":rails_root/public/assets/hotels/:id/:style/:basename.:extension"

  def my_logger
    @@my_logger ||= Logger.new("#{Rails.root}/log/my.log")
  end

  def before_save
    my_logger.info("Creating user with name #{self.name}")
  end


end
