class HotelsController < ApplicationController

def rating
#@h_id = Hotel.find(params[:id]).id
#@u_id = session[:user]
#@hotel = Hotel.find(:id)
#mean
@hotel = Hotel.find(params[:hotel][:id])
@rating = Rating.find_by(hotel_id: params[:hotel][:id], user_id: session[:user])
if @rating == nil
   @rating = @hotel.rating.build(user_id: session[:user])
end
@rating.update(rating: params[:rating])
@hotel.update(rate: Rating.where("hotel_id = ?", params[:hotel][:id] ).average(:rating).to_f)
 if @hotel.save
      redirect_to @hotel
      end
end


def update
end
  

def mean
@hotel.update(rate: Rating.where("hotel_id = ?", @hotel.id ).average(:rating).to_f)
    
end

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
    mean
    #rating
	end

	  def create

    @hotel = Hotel.new(hotel_params)

    @address = @hotel.build_address(address_params)

    @rating = @hotel.rating.build(rating_params)
    @rating.update(user_id: session[:user]) 
    
    

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
