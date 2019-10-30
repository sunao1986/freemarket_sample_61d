class ItemsController < ApplicationController

  def index
    #トップページ
  end

  def new
    #商品登録画面
  end

  def create
  end

  def updata
  end

  def destroy
  end

  def edit
    #商品編集画面
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find(params[:id])
  end

  def buy
    #購入確認画面
  end

  private

  def item_params
    params.permit(:id, :name, :discription, :status, :delivery_cost, :delivery_method, :delivery_area, :delivery_days, :price, :likes_count, :buyer_id, :condition)
  end

  def user_params
    params.permit(:id, :nickname)
  end

end