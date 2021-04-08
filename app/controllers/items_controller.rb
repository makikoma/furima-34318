class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order('id DESC')
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
      :image, :name, :explanation, :category_id, :condition_id, :postage_id, :area_id, :delivery_day_id, :price
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  # 商品購入機能実装後に実装する
  # ログイン状態の出品者であっても、URLを直接入力して自身の売却済み商品の商品情報編集ページへ遷移しようとすると、トップページに遷移すること
  def move_to_index
    redirect_to root_path unless @item.user_id == current_user.id
  end
  # //ログイン状態の出品者であっても、URLを直接入力して自身の売却済み商品の商品情報編集ページへ遷移しようとすると、トップページに遷移すること
  # //商品購入機能実装後に実装する
end
