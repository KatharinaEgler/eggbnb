class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :chicken

  validates :start_date, presence: true
  validates :end_date, presence: true

  def price_calculation
    (booking.end_date - booking.start_date) * booking.chicken.price
  end
end
