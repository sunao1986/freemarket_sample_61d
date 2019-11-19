class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :buy, :show, :pay]
  before_action :authenticate_user!, except: :index
  def index

    # @q = User.ransack(params[:q])
    # @items = @q.result(distinct: true)

    #人気のカテゴリー

    #レディース
    # @ladies_items = Item.recent.where(category_params[:ancestry])。。。もしかしたらancestryで持ってくる方法を使うかもなので残しました
    #カテゴリテーブルが完成形になった時に指定idの範囲変えるかも。なので、データさえあれば、ひとまずレディースのみだが後でコピーすればすぐできる
    @ladies_items = Item.recent.where(category_id: 1..199).where(condition: 0).order('created_at DESC').limit(10).where.not(condition: 1)
    #メンズ
    @mens_items = Item.recent.where(category: 201..345).where(condition: 0).order('created_at DESC').limit(10).where.not(condition: 1)
    #家電
    @appliance_items = Item.recent.where(category: 899..983).where(condition: 0).order('created_at DESC').limit(10).where.not(condition: 1)
    #おもちゃ
    @toy_items = Item.recent.where(category: 686..797).where(condition: 0).order('created_at DESC').limit(10).where.not(condition: 1)

    #人気のブランド
    @chanel_items = Item.recent.where(brand:2).where(condition: 0).order('created_at DESC').limit(10).where.not(condition: 1)
    @vuitton_items = Item.recent.where(brand:3).where(condition: 0).order('created_at DESC').limit(10).where.not(condition: 1)
    @sup_items = Item.recent.where(brand:4).where(condition: 0).order('created_at DESC').limit(10).where.not(condition: 1)
    @nike_items = Item.recent.where(brand:5).where(condition: 0).order('created_at DESC').limit(10).where.not(condition: 1)


  end

  def new
    @item = Item.new
    @item.images.build
    @category_parents = Category.where(ancestry: nil).pluck(:name)
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
      redirect_to action: :index
    else
      redirect_to action: :buy
    end
  end

  def update
    if @item.update(update_item_params)
      redirect_to action: :index
    else
      redirect_to action: :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to action: :index
  end

  def edit
    @item.images.build
    @category_parents = Category.where(ancestry: nil).pluck(:name)
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
    @brand  = @item.brand_id
    @comments = @item.comments.includes(:user)
    @seller_items = @item.user.items.limit(6).where.not(id: @item.id)
    @other_items = @item.category.items.limit(6).where.not(id: @item.id)
    impressionist(@item, nil, unique: [:session_hash])
  end

  def buy
    @user = User.find(current_user.id)
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
    if @card.present?
      Payjp.api_key = "sk_test_0e21a1a16d0a0e377209db69"
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    @item = Item.find(params[:id])
    Payjp.api_key = 'sk_test_0e21a1a16d0a0e377209db69'
    Payjp::Charge.create(
      amount: @item.price,
      card: params['payjp-token'],
      currency: 'jpy'
    )
    @item.update(condition: 1,buyer_id: current_user.id)
    redirect_to action: :index
  end

  def item_search
    @items = Item.where('name LIKE(?)', "%#{params[:name]}%").page(params[:page]).per(20).order("created_at DESC")
    @search_name = params[:name]
  end

  private

  def item_params
    params.require(:item).permit(:name, :discription, :status, :delivery_cost, :delivery_method, :delivery_area, :delivery_days, :price, :likes_count, :buyer_id, :condition, :category_id, :brand_id, :size_id, images_attributes: [:image_url]).merge(user_id: current_user.id)
  end

  def update_item_params
    params.require(:item).permit(:name, :discription, :status, :delivery_cost, :delivery_method, :delivery_area, :delivery_days, :price, :likes_count, :buyer_id, :condition, :category_id, :brand_id, :size_id, images_attributes: [:image_url,:id]).merge(user_id: current_user.id)
  end

  def user_params
    params.permit(:id, :nickname)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end