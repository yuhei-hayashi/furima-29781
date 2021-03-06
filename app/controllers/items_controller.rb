class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :exhibitor_only, only: [:edit, :destroy]
  before_action :item_find, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
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
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :genre_id, :status_id, :delivery_id, :area_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  def exhibitor_only
    item = Item.find(params[:id])
    redirect_to root_path unless user_signed_in? && current_user.id == item.user.id
  end

  def item_find
    @item = Item.find(params[:id])
  end
end
