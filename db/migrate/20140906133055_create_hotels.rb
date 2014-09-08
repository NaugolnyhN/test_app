class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|

    	t.string :title
    	t.boolean :breakfast
    	t.string :description
    	t.float :price
    	

      t.timestamps
    end
  end
end
