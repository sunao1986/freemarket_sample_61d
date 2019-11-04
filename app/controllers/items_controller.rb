class ItemsController < ApplicationController

  def index
    #トップページ
  end

  def new
    #商品登録画面
    @item = Item.new
  end

  def create
    binding.pry
    @item = Item.create(
      name: item_params[:name], 
      discription: item_params[:discription], 
      status: item_params[:status], 
      delivery_cost: item_params[:delivery_cost], 
      delivery_method: item_params[:delivery_method], 
      delivery_area: item_params[:delivery_area], 
      delivery_days: item_params[:delivery_days], 
      price: item_params[:price], 
    )
    # seller_id: params[:current_user]
    # category: params[:category]
    # size: params[:size]
    # brand: params[:brand]
    
    if @item.save
      render :index
    else
      redirect_to action: :buy
    end
  end

  def updata
    item = Item.find(params[:id])
    if item.user_id == current_user.id
       item.update(item_params)
       render :index
    end
    # if  current_user ==! seller_id && params[:id].present?
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
    @user = User.find(params[:id])
  end

  def buy
    #購入確認画面
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:id, :name, :discription, :status, :delivery_cost, :delivery_method, :delivery_area, :delivery_days, :price, :likes_count, :buyer_id, :condition, images_attributes: [:image_url, :image_ids => [] ])
    # form_forはrequireをつける、追加はseller_id、category、size、brand
  end

  def user_params
    params.permit(:id, :nickname)
  end

end