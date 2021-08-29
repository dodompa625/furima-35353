class ProductsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
  
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:product_image, :product_name, :text, :price, :text, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :delivery_date_id).merge(user_id: current_user.id)
  end
end
