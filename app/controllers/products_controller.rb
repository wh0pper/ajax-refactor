class ProductsController < ApplicationController
  before_filter :authorize, except: [:index, :show]

  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end

  def show
    @product = Product.find(params[:id])
    @order_item = current_order.order_items.new
    respond_to do |format|
      format.html { redirect_to products_path }
      format.js
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully created."
      redirect_to '/'
    else
      flash[:alert] = "Something went wrong. Please try again."
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product successfully updated."
      redirect_to products_path
    else
      flash[:alert] = "Something went wrong. Please try again."
      render :edit
    end
  end

  def destroy
    if Product.find(params[:id]).destroy
      flash[:notice] = "Product successfully deleted."
      redirect_to products_path
    else
      flash[:alert] = "Something went wrong. Please try again."
      render :edit
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
