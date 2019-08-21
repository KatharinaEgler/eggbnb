class AddAddressToChicken < ActiveRecord::Migration[5.2]
  def change
    add_column :chickens, :address, :string
  end
end
