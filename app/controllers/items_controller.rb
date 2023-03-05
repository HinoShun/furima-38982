class ItemsController < ApplicationController
  before_action :authenticate_user!,  only: [:new, :create, :edit, :destroy]
  before_action :set_item,            only: [:show, :edit, :update ]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
  end

  def edit
    unless @item.user == current_user
      redirect_to root_path
    end
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    item =Item.find(params[:id])
    unless item.user == current_user
      redirect_to root_path
    else
      item.destroy
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :content, :category_id, :condition_id, :postage_id, :prefecture_id, :shipping_day_id, :price ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
