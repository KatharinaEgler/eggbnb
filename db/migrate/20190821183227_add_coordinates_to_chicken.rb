class AddCoordinatesToChicken < ActiveRecord::Migration[5.2]
  def change
    add_column :chickens, :latitude, :float
    add_column :chickens, :longitude, :float
  end
end
