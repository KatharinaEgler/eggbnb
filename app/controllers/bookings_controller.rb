class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def create
    @chicken = Chicken.find(params[:chicken_id])
    @booking = Booking.new(booking_params)
    @booking.chicken = @chicken
    if @booking.save
      redirect_to chicken_path(@chicken)
    else
      render "chickens/show"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :chicken_id)
  end
end
