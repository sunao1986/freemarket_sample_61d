class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :buy]

  def index
    #トップページ
  end

  def new
    #商品登録画面
    @item = Item.new
    @item.images.build
    @parents = Category.all.order("id ASC").limit(13)
    @size = Size.all
    @barand = Brand.all   
  end

  def create
    @item = Item.new(item_params)
    
    if @item.save
      render :index
    else
      redirect_to action: :buy
    end
  end

  def updata
    if current_user ==! user_id && params[:id].present?
       @item.update(item_params)
       render :index
    else
      redirect_to action: :edit

    end
    # if current_user ==! user_id && params[:id].present?
      # Item.update(buyer_id: params[:current_user])
      # conditionを入力する分岐を記述
  end

  def destroy
  end

  def edit
    #商品編集画面
  end

  def show
    @item = Item.find(params[:id])
    @seller_items = @item.user.items.limit(6).where.not(id: @item.id)
    # @other_items = @item.category.limit(6).where(id: @item.category)
    # カテゴリ未作成のため、コメントアウト中
  end

  def buy
    #購入確認画面
  end

  private

  def item_params
    params.require(:item).permit(:id, :name, :discription, :status, :delivery_cost, :delivery_method, :delivery_area, :delivery_days, :price, :likes_count, :category_id, :brand_id, :size_id, images_attributes: [:id, :image_url]).merge(user_id: current_user.id)
    #  :buyer_id,  :condition, はタイミングが別
  end

  def user_params
    params.permit(:id, :nickname)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end