class OrdersController < ApplicationController
  before_action :item_find

  def index
    @order = OrderAddress.new(order_params)
  end

  def create
    @order = OrderAddress.new(order_params)
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
    params.permit(:post_code , :prefecture , :city ,:house_number , :building , :telephone, :token).merge(user_id: current_user.id , item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
  def item_find
    @item = Item.find(params[:item_id])
  end
end
