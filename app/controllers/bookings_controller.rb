class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def create
    @chicken = Chicken.find(params[:chicken_id])
    @booking = Booking.new(booking_params)
    @booking.chicken = @chicken
    if @booking.save
      redirect_to bookings_path(@booking)
    else
      render "chickens/show"
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(status: params[:status])
    redirect_to booking_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:id, :start_date, :end_date, :user_id, :chicken_id)
  end
end
