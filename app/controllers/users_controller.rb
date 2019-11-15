class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  before_action :authenticate_user!, except: :new

  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    @user.update(update_user_params)
    redirect_to action: :edit
  end

  def destroy
  end

  def show
    #マイページトップ
  end

  def profile
  end

  def intro
    #プロフィール表示画面
  end

  def listing
    #出品中
  end

  def progress
    #出品取引中
  end

  def completed
    #出品売却済
  end

  def purchase
    #購入取引中
  end

  def purchased
    #購入した商品
  end

  def logout
  end

  def phone
    @phone_number = User.new
  end

  private

  def update_user_params
    params.require(:user).permit(:email, :introduction, :postal_code, :prefectures, :city, :address, :building, :nickname)
  end

  def set_user
    @user = User.find(params[:id])
  end
end