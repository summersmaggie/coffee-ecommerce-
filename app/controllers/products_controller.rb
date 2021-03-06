class ProductsController < ApplicationController

  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end

  def new
    @product = Product.new
  end

  def show
    @products = Product.all
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Your product has been saved."
      redirect_to root_path
    else
      flash[:notice] = "Something went wrong. Please try again."
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:image)
  end
end
