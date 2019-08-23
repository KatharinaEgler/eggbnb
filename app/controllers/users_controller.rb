class UsersController < ApplicationController
  # def index
  #   @users = User.all
  # end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  # def create
  #   @user = User.new(user_params)
  #   @user = current_user
  #   if @user.save!
  #     redirect_to users_path
  #   else
  #     render "users/show"
  #   end
  # end

  # def update
  #   @user = User.find(params[:id])
  #   @user.update(user_params)
  #   redirect_to user_path(current_user)
  # end

  # def user_params
  #   params.require(:user).permit(:first_name, :last_name, :email, :photo)
  # end
end
