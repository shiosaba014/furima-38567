class ConsumersController < ApplicationController
  def index
    @consumer_buyer = ConsumerBuyer.new
    @item = Item.find(params[:item_id])
  end

def new
end

  def create
    @item = Item.find(params[:item_id])
    @consumer_buyer = ConsumerBuyer.new(consumer_params)
    if @consumer_buyer.valid?
      @consumer_buyer.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def consumer_params
    params.require(:consumer_buyer).permit(:post_code,:address_id,:municipalities,:address_number,:building,:tel).merge(consumer_id: current_user.id,user_id: current_user.id,item_id:@item.id)
  end

end
