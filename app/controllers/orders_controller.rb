class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :user_check
  before_action :sold_check
  
  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay
      @order_address.save
      redirect_to root_path
    else
      render :index
   end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def pay
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def user_check
    if @item.user == current_user
      redirect_to root_path
    end
  end

  def sold_check
    if  @item.order.present?
      redirect_to root_path
    end
  end
  
end
