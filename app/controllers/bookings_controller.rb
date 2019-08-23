class BookingsController < ApplicationController

  def index
    @bookings = policy_scope(Booking)
    @my_chickens = @bookings.joins(:chicken).where(chickens: { user: current_user })
    @my_bookings = @bookings.where(user: current_user)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @chicken = Chicken.find(params[:chicken_id])
    @booking = Booking.new(booking_params)
    @booking.chicken = @chicken
    @booking.user = current_user
    authorize @booking
    if @booking.save!
      redirect_to bookings_path
    else
       render "chickens/show"
     end
  end



  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(status: params[:status])
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:id, :start_date, :end_date, :user_id, :chicken_id)
  end
end
