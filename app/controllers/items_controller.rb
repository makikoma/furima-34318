class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.with_attached_images.includes(:purchase).order('id DESC')
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
    # チェックを入れた画像を削除する
    if params[:item][:image_ids]
      params[:item][:image_ids].each do |image_id|
        image = @item.images.find(image_id)
        image.purge
      end
    end

    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end

  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :explanation, :category_id, :condition_id, :postage_id, :area_id, :delivery_day_id, :price, images: []
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.with_attached_images.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless @item.user_id == current_user.id && @item.purchase.nil?
  end
end
