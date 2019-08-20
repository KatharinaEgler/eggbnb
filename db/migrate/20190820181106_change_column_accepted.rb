class ChangeColumnAccepted < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :accepted, :boolean
    add_column :bookings, :status, :string, default: "Pending"
  end
end
