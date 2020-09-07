class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    if @item.save
      redirect_root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:name , :explamation , :genre_id , :status_id , :delivery_id , :area_id , :day_id , :price, :image ).marge(user_id: current_user.id)
  end
end
