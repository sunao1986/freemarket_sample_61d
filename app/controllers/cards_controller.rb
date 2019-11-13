class CardsController < ApplicationController
  require "payjp"
  before_action :set_card

  def index
    if @card.present?
      Payjp.api_key = "sk_test_0e21a1a16d0a0e377209db69"
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def new
    card = Card.where(user_id: current_user.id)
    redirect_to action: "index" if card.exists?
  end

  def create
    card = Card.where(user_id: current_user.id)
    Payjp.api_key = 'sk_test_0e21a1a16d0a0e377209db69'
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "index"
      else
        redirect_to action: "create"
      end
    end
  end

  def destroy #PayjpとCardのデータベースを削除
    Payjp.api_key = "sk_test_0e21a1a16d0a0e377209db69"
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    if @card.destroy #削除に成功した時にポップアップを表示します。
      redirect_to action: "index", notice: "削除しました"
    else #削除に失敗した時にアラートを表示します。
      redirect_to action: "index", alert: "削除できませんでした"
    end
  end

  private

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end
