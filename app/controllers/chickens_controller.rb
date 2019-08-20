class ChickensController < ApplicationController
  def index
    @chickens = Chicken.all
  end

  def show
    @chicken = Chicken.find(params[:id])
  end

  def new
    @chicken = Chicken.new
  end

  def create
    @chicken = Chicken.new(chicken_params)
    @chicken.user_id = User.first.id
    if @chicken.save
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
    params.require(:chicken).permit(:name, :add, :price, :egg_color, :egg_volume, :description, :photo)
  end
end
