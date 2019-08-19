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
    @chicken = Chicken.new(c)
  end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end
end
