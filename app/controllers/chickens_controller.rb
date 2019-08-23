class ChickensController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_chicken, only: [:show, :edit, :update, :destroy]

  def index
    # PUNDIT:
    @chickens = policy_scope(Chicken.geocoded)

    # GEOMAP:
    # @chickens = Chicken.geocoded
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
    @booking = Booking.new
    authorize @chicken
  end

  def new
    @chicken = current_user.chickens.new
    authorize @chicken
  end

  def create
    @chicken = current_user.chickens.new(chicken_params)
    authorize @chicken
    # @chicken.price = @chicken.price * 100 ==> is it still necessary to keep this as a comment?
    # @chicken.user_id = User.first.id ==> comment this line because doesn't work

    if @chicken.save!
      redirect_to chicken_path(@chicken)
    else
      render :new
      # redirect_to chicken_new_path
    end
  end

  def edit
    authorize @chicken
  end

  def update
    authorize @chicken

    if @chicken.update(chicken_params)
      redirect_to chicken_path(@chicken)
    else
      render :edit
    end
  end

  def destroy
    authorize @chicken

    @chicken.destroy

    redirect_to chickens_path
  end

  private

  def chicken_params
    params.require(:chicken).permit(:name, :address, :age, :price, :egg_color, :egg_volume, :description, :photo)
  end

  def set_chicken
    @chicken = Chicken.find(params[:id])
  end
end
