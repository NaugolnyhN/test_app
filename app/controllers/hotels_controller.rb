class HotelsController < ApplicationController

	def index
		@hotels = Hotel.all
		logger.debug @hotel
	end

	def new
		@hotel = Hotel.new
        @address = Address.new
        @rating = Rating.new

	end
	

	def show
		@hotel = Hotel.find(params[:id])
		
	end

	  def create

    @hotel = Hotel.new(hotel_params)
     
    @hotel.update(rating: 3.6)


    @address = @hotel.build_address(address_params)

    @rating = @hotel.rating.build(rating_params)
    @rating.update(user_id: session[:user]) 

    #@r = Rating.where("hotel_id = ?", params[:hotel_id] ).average("rating")
    

    if @hotel.save
      redirect_to @hotel
    else
      render 'new'
    end
  end

  private 

    def hotel_params
      params.require(:hotel).permit(:title, :breakfast, :price, :description,:photo, :rating)
    end
    def address_params
      params.require(:address).permit(:country, :state, :city, :street, :hotel_id )
    end
    def rating_params
      params.require(:rating).permit(:rating, :user_id, :hotel_id )
    end


end
