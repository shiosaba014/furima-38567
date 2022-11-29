class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item_form = ItemForm.new
  end

  def create
    @item_form = ItemForm.new(item_params)
    if @item_form.valid? 
      @item_form.save
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
    item_attributes = @item.attributes
    @item_form = ItemForm.new(item_attributes)
    @item_form.tag_name = @item.tags.first&.tag_name
  end

  def update
    @item_form = ItemForm.new(item_params)

    @item_form.images ||= @item.images.blobs

    if @item_form.valid?
      @item_form.update(item_params,@item)
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

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['tag_name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end

  def search2
    if params[:q]&.dig(:name)
      squished_keywords = params[:q][:name].squish
      params[:q][:name_cont_any] = squished_keywords.split(" ")
    end
    @q = Item.ransack(params[:q])
    @items = @q.result
  end

  private

  def item_params
    params.require(:item_form).permit(
                                    :name, :explan, :category_id, :situation_id,
                                    :delivery_charge_id, :address_id, :period_id, :price,
                                    :tag_name, {images:[]} ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
