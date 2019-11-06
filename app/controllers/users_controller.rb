class UsersController < ApplicationController
  # before_action :authenticate_user!, except: :new

  def new
    #今のところ使わない
  end
  
  def new
  end

  def create
  end

  def edit
    #本人情報編集
  end

  def updata
  end

  def destroy
  end

  def show
    #マイページトップ
  end

  def profile
    #プロフィール編集画面
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

end
