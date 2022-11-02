class BuyersController < ApplicationController

  def index
    @buyer_consumer = BuyerConsumer.new
    @item = Item.find(params[:item_id])
  end

def new
end

  def create
    @buyer_consumer = BuyerConsumer.new(buyer_params)
    if @buyer_consumer.valid?
      @buyer_consumer.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_consumer).permit(:post_code,:address_id,:municipalities,:address_number,:building,:tel).merge(consumer_id: current_user.id,user_id: current_user.id)
  end

end
