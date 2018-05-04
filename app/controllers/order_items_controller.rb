class OrderItemsController < ApplicationController

  def create
    @order = current_order
    @item = OrderItem.new(item_params)
    @order.add_item(@item)
    session[:order_id] = @order.id
    respond_to do |format|
      format.html { redirect_to products_path }
      format.js
    end
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
    respond_to do |format|
      format.html { redirect_to cart_path }
      format.js
    end
  end

  private

  def item_params
    if params[:order_item][:quantity] == ''
      params[:order_item][:quantity] = 1
    end
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
