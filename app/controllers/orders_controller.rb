class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  def order_params
    params.require(:order_address).permit(:post_code , :prefecture , :city ,:house_number , :building , :telephone).merge(user_id: current_user.id , item_id: params[:item_id])
  end
end
