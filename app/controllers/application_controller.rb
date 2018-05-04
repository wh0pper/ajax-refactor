class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :admin
  helper_method :current_order

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admin
    current_user && current_user.admin
  end

  def current_order
    if session[:order_id]
      order = Order.find(session[:order_id])
      session[:order_id] = order.id
      return order
    else
      order = Order.retrieve_or_create(current_user)
      session[:order_id] = order.id
      return order 
    end
  end

  def authorize
    redirect_to '/sign_in' unless admin
  end
end
