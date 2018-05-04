class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:notice] = "Welcome! Your account was created successfully."
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:alert] = "Oops! Something went wrong. Please try again"
      redirect_to '/sign_up'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
