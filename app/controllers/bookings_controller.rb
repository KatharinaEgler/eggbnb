class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @chicken = Chicken.find(params[:chicken_id])
    @booking = Booking.new(booking_params)
    @booking.chicken = @chicken
    @booking.user = current_user
    if @booking.save!
      redirect_to chickens_path
    else
       render "chickens/show"
     end
  end



  def update
    @booking = Booking.find(params[:id])
    @booking.update(status: params[:status])
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:id, :start_date, :end_date, :user_id, :chicken_id)
  end
end
