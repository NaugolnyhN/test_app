class AddRatingToHotels < ActiveRecord::Migration
  def change
  	add_column :hotels, :rate, :float
  	add_column :hotels, :voters, :integer 
  end
end
