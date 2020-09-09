class OrdersController < ApplicationController
  before_action  :move_to_index , :item_find, :new_order, :check_saled, :kick_exhibitor

  def index
  end

  def create
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:post_code, :area_id, :city, :house_number, :building, :telephone, :token).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def new_order
    @order = OrderAddress.new(order_params)
  end

  def check_saled
    redirect_to root_path unless Order.find_by(item_id: params[:item_id]).nil?
  end

  def kick_exhibitor
    item = Item.find(params[:item_id])
    redirect_to root_path if user_signed_in? && current_user.id == item.user.id
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
end
