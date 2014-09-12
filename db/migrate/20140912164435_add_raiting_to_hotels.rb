class AddRaitingToHotels < ActiveRecord::Migration
  def change
  	add_column :hotels, :raiting, :integer
  end
end
