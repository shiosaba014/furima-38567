class ConsumersController < ApplicationController
  before_action :authenticate_user!
  before_action :make_item

  def index
    @consumer_buyer = ConsumerBuyer.new
    if @item.consumer || @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def create
    @consumer_buyer = ConsumerBuyer.new(consumer_params)
    if @consumer_buyer.valid?
      pay_item
      @consumer_buyer.save
      redirect_to root_path
    else
      make_item
      render :index
    end
  end

  private

  def consumer_params
    params.require(:consumer_buyer).permit(:post_code, :address_id, :municipalities, :address_number, :building, :tel).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def make_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end
