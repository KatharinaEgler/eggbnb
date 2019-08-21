class ChangePriceToFloatForChicken < ActiveRecord::Migration[5.2]
  def change
    change_column :chickens, :price, :float
  end
end
