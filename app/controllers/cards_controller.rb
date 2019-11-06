class CardsController < ApplicationController
   
  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    
    if @card.save
      render "items/index"
    else
      redirect_to action "new"
    end
  end

  def edit
  end

  def update
  end

  def destory
  end

  private

  def card_params
    params.require(:card).permit(:card_number, :limit_month, :limit_year, :security_code)
    #  :buyer_id,  :condition, はタイミングが別
  end


end
