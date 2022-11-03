class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.all.order('created_at DESC')
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
    if @item.user_id != current_user.id || @item.consumer
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
    end
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :explan, :category_id, :situation_id, :delivery_charge_id, :address_id, :period_id, :price,
                                 :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
