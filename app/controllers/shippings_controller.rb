class ShippingsController < ApplicationController
    
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
  end

  def update
  end

  def destory
  end
  
  private
  def shipping_params
    params.require(:shipping).permit(:first_name, :last_name, :first_kana, :last_kana, :postal_code, :prefectures, :city, :address, :building, :phone_number).merge(user_id: current_user.id)
  end    
end
