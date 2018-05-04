class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if current_order.user_id.nil?
        user.orders.push(current_order)
      end
      flash[:notice] = "Successfully signed in!"
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:alert] = "Oops. Something went wrong. Please try again"
      redirect_to '/sign_in'
    end
  end

  def destroy
    flash[:notice] = "Successfully signed out!"
    session[:user_id] = nil
    session[:order_id] = nil
    redirect_to '/sign_in'
  end

end
