class AddAceptanceToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :accepted, :boolean, default: false
  end
end
