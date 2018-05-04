class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if current_order.user_id.nil?
        user.orders.push(current_order)
      end
      session[:user_id] = user.id
      redirect_to '/'
    else
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
