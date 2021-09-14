class OrdersController < ApplicationController
   before_action :authenticate_user!
   before_action :set_order, only: [:index, :create]
   before_action :ensure_current_user, only:[:index, :create]

  def index
    @order_address = OrderAddress.new
    
    unless current_user.id != @product.user_id && Order.exists?(@product.id) == false
      redirect_to root_path
    end
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
      if @order_address.valid?
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]

        Payjp::Charge.create(
        amount: @product.price,
        card: order_address_params[:token],
        currency: 'jpy'
      )
        @order_address.save
        return redirect_to root_path
      else
        render 'index'
      end
  end

  private
  
    def set_order
      @product = Product.find(params[:product_id])
    end

    def order_address_params
      params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :receiver_telephone,).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
    end

    def ensure_current_user
      if @product.user_id == current_user.id
        redirect_to root_path
      end
    end
end