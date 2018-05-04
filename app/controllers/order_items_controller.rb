class OrderItemsController < ApplicationController

  def create
    @order = current_order
    binding.pry

    @item = @order.order_items.new(item_params)
    @order.save
    session[:order_id] = @order.id
    redirect_to products_path
  end

  def update
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.update_attributes(item_params)
    @order.save
  end

  def destroy
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.destroy
    @order.save
    redirect_to cart_path
  end

  private

  def item_params
    if params[:order_item][:quantity] == ''
      params[:order_item][:quantity] = 1
    end
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
