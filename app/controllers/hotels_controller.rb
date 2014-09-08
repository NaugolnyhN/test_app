class HotelsController < ApplicationController

	def index
		@hotels = Hotel.all
	end

	def new
		@hotel = Hotel.new
		@address = Address.new
	end
	

	def show
		@hotel = Hotel.find(params[:id])
	end

	  def create
    @hotel = Hotel.new(hotel_params)
    if @hotel.save
      redirect_to @hotel
    else
      render 'new'
    end
  end

  private 

    def hotel_params
      params.require(:hotel).permit(:title)
    end
end
