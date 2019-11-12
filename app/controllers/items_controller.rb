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
    @item = Item.new
    @item.images.build
    @category_parents = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parents << parent.name
    end
    @size = Size.all
    @brand = Brand.all

  end

  def category_child
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil ).children
  end

  def category_gchild
    @category_gchildren = Category.find_by(id: params[:child_id]).children
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
    if @item.update(update_item_params)
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
    @item.images.build
    @category_parents = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parents << parent.name
    end

    @category_child = @item.category.parent.parent.children
    @category_gchild = @item.category.parent.children
    @size = Size.all
    @brand = Brand.all
    @images = Image.where(item_id: params[:item_id])
    respond_to do |format|
      format.html
      format.json { @images }
    end
  end

  def show
    @item = Item.find(params[:id])
    @seller_items = @item.user.items.limit(6).where.not(id: @item.id)
    # @other_items = @item.category.limit(6).where(id: @item.category)
    # カテゴリ未作成のため、コメントアウト中
  end

  def buy
  end

  private

  def item_params
    params.require(:item).permit(:name, :discription, :status, :delivery_cost, :delivery_method, :delivery_area, :delivery_days, :price, :likes_count, :category_id, :brand_id, :size_id, images_attributes: [:image_url]).merge(user_id: current_user.id)
  end

  def update_item_params
    params.require(:item).permit(:name, :discription, :status, :delivery_cost, :delivery_method, :delivery_area, :delivery_days, :price, :likes_count, :category_id, :brand_id, :size_id, images_attributes: [:image_url,:id]).merge(user_id: current_user.id)
  end

  def user_params
    params.permit(:id, :nickname)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end