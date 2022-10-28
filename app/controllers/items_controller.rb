class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
  end

  def new
  end

  def create
  @user = User.find(params[:user_id])
  @item = @user.items.new(item_params)
  @item.save
  end

  private
  def item_params
    params.require(:item).permit(:name,:explan,:category_id,:situation_id,:delivery_chage_id,:address_id,:period_id,:price,:image).merge(user_id: current_user.id)
  end

end
