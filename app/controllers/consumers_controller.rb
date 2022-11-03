class ConsumersController < ApplicationController
  before_action :authenticate_user!

  def index
    @consumer_buyer = ConsumerBuyer.new
    @item = Item.find(params[:item_id])
    if @item.consumer
      redirect_to root_path
    elsif @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def new
  end

  def create
    @item = Item.find(params[:item_id])
    @consumer_buyer = ConsumerBuyer.new(consumer_params)
    if @consumer_buyer.valid?
      pay_item
      @consumer_buyer.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def consumer_params
    params.require(:consumer_buyer).permit(:post_code, :address_id, :municipalities, :address_number, :building, :tel).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
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
