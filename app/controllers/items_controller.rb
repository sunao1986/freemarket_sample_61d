class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :buy, :show]
  before_action :authenticate_user!, except: :index
  def index
    # @q = User.ransack(params[:q])
    # @items = @q.result(distinct: true)

    #人気のカテゴリー

    #レディース
    # @ladies_items = Item.recent.where(category_params[:ancestry])。。。もしかしたらancestryで持ってくる方法を使うかもなので残しました
    #カテゴリテーブルが完成形になった時に指定idの範囲変えるかも。なので、データさえあれば、ひとまずレディースのみだが後でコピーすればすぐできる
    @ladies_items = Item.recent.where(category_id: 3..60)
    #メンズ
    # @mens_items = Item.recent.where(category:)
    #家電
    # @appliance_items = Item.recent.where(category:)
    #おもちゃ
    # @toy_items = Item.recent.where(category:)

    #人気のブランド
    # binding.pry
    # @chanel_items = Item.recent.where(brand:2)
    @chanel_items = Item.all
    @vuitton_items = Item.recent.where(brand:3)
    @sup_items = Item.recent.where(brand:4)
    @nike_items = Item.recent.where(brand:5)

  end

  def new
    #商品登録画面
    @item = Item.new
    @item.images.build
    @parents = Category.all.order("id ASC").limit(13)
    # @child = @parents.children
    # @grandchild = @child.children
    @size = Size.all
    @brand = Brand.all
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      render :index
    else
      redirect_to action: :buy
    end
  end

  def update
    if @item.update
       render :index
    else
      redirect_to action: :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
  end

  def edit
    # @item.images.build
    @parents = Category.all.order("id ASC").limit(13)
    @size = Size.all
    @brand = Brand.all 
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
    params.require(:item).permit(:name, :discription, :status, :delivery_cost, :delivery_method, :delivery_area, :delivery_days, :price, :likes_count, :category_id, :brand_id, :size_id, images_attributes: [:image_url]).merge(user_id: current_user.id)
    #  :buyer_id,  :condition, はタイミングが別
  end

  def user_params
    params.permit(:id, :nickname)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end