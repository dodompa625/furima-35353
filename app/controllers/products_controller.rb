class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_product, only:[:show, :edit, :update]
  before_action :ensure_current_user, only:[:edit, :update]
  
  def index
    @products = Product.all.order("created_at DESC")
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

  def show
  
  end

  def edit

  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  private
  def product_params
    params.require(:product).permit(:product_image, :product_name, :text, :price, :text, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :delivery_date_id).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
  
  def ensure_current_user
    if @product.user_id != current_user.id
      redirect_to action: :index
    end
  end
end 