class HotelsController < ApplicationController

	def index
		@hotels = Hotel.all
	end

	def new
		#@hotel = Hotel.new
		#@h = {@hotel => Hotel.new, @address => Address.new}
        @address = Address.new
	end
	

	def show
		@hotel = Hotel.find(params[:id])
		@address = Address.find(params[:id])
		#@h = {@hotel => Hotel.find(params[:id]), @address => Address.find(params[:id])}
	end

	  def create
    #@hotel = Hotel.new(hotel_params)
    @address = Address.new(address_params)
    if @address.save
      redirect_to @address
    else
      render 'new'
    end
  end

  private 

    def hotel_params
      params.require(:hotel).permit(:title, :breakfast, :price, :description)
    end
    def address_params
      params.require(:address).permit(:country, :state, :city, :street)
    end
end
