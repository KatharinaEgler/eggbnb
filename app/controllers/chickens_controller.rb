class ChickensController < ApplicationController
  def index
    # @chickens = Chicken.all

    # PUNDIT:
    # @chickens = policy_scope(Chicken) ==> HOW TO INCLUDE THIS WHITOUT MAKING TROUBLE WITH GEOCODE??

    # GEOMAP:
    @chickens = Chicken.geocoded
    @markers = @chickens.map do |chicken|
      {
       lat: chicken.latitude,
       lng: chicken.longitude,
       image_url: helpers.asset_url('logo1.png')
       # infoWindow: render_to_string(partial: "info_window", locals: { chicken: chicken })
      }
    end
  end

  def show
    @chicken = Chicken.find(params[:id])
    @booking = Booking.new
  end

  def new
    @chicken = Chicken.new
  end

  def create
    @chicken = Chicken.new(chicken_params)

    # @chicken.price = @chicken.price * 100
    @chicken.user_id = User.first.id

    # PUNDIT:
    authorize @restaurant

    if @chicken.save!
      redirect_to chickens_path
    else
      render :new
      # redirect_to chicken_new_path
    end
  end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

  private

  def chicken_params
    params.require(:chicken).permit(:name, :address, :age, :price, :egg_color, :egg_volume, :description, :photo)
  end
end
