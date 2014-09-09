class HotelsController < ApplicationController

	def index
		@hotels = Hotel.all
	end

	def new
		@hotel = Hotel.new
		#@h = {@hotel => Hotel.new, @address => Address.new}
        @address = Address.new
	end
	

	def show
		@hotel = Hotel.find(params[:id])
		#@address = Address.find(params[:id])
		#@h = {@hotel => Hotel.find(params[:id]), @address => Address.find(params[:id])}
	end

	  def create
    @hotel = Hotel.new(hotel_params)
    #@address.save
    if @hotel.save
      redirect_to @hotel
    else
      render 'new'
    end
  end

  private 

    def hotel_params
      params.require(:hotel).permit(:title, :breakfast, :price, :description)
    end
end
