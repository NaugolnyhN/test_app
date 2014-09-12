class HotelsController < ApplicationController

	def index
		@hotels = Hotel.all
		logger.debug @hotel
	end

	def new
		@hotel = Hotel.new
        @address = Address.new
        logger.debug @hotel

	end
	

	def show
		@hotel = Hotel.find(params[:id])
		@address = Address.find(params[:id])
		
	end

	  def create
    @hotel = Hotel.new(hotel_params)
    @address = @hotel.build_address(address_params)
    if @hotel.save
      redirect_to @hotel
    else
      render 'new'
    end
  end

  private 

    def hotel_params
      params.require(:hotel).permit(:title, :breakfast, :price, :description,:photo, :raiting)
    end
    def address_params
      params.require(:address).permit(:country, :state, :city, :street, :hotel_id )
    end
end
