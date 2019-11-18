class ShippingsController < ApplicationController

  before_action :set_shipping, only: [:edit, :editbuy, :update]

  def new
    @shipping = Shipping.new
  end

  def create
    @shipping = Shipping.new(shipping_params)
    if @shipping.save
      redirect_to root_path
    else
      render :new  
    end
  end

  def edit
    @shipping = Shipping.find_by(user_id: current_user.id)
  end

  def editbuy
    @shipping = Shipping.find_by(user_id: current_user.id)
  end

  def update
    @shipping.update(shipping_params)
    @item = Item.new
    @item = Item.find_by(params[:id])
    if request.referer.include?("/editbuy")
      redirect_to "/items/#{@item.id}/buy"
    else request.referer.include?("/edit/")
      redirect_to edit_shipping_path(current_user.id)
    end  
  end

  def destory
  end
  
  private
  def shipping_params
    params.require(:shipping).permit(:first_name, :last_name, :first_kana, :last_kana, :postal_code, :prefectures, :city, :address, :building, :phone_number).merge(user_id: current_user.id)
  end    

  def set_shipping
    @shipping = Shipping.find_by(user_id: current_user.id)
  end
  
end
