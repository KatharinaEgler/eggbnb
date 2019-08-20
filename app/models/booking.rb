class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :chicken

  def price_calculation
    (booking.end_date - booking.start_date) * booking.chicken.price
  end
end
