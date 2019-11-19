class CategoriesController < ApplicationController

  def show
    @search_name = Category.find(params[:id])
    @category = Category.find(params[:id])
    categories = @category.subtree
    categories_ids = []
    categories.each do |category|
      categories_ids << category.id
    end
    if @category.ancestry == nil
      @items = Item.where(category_id: [categories_ids]).page(params[:page]).per(20).order("created_at DESC")
    elsif @category.ancestry =~ /^[0-1000]+$/
      @items = Item.where(category_id: [categories_ids]).page(params[:page]).per(20).order("created_at DESC") 
    else
      @items = Item.where(category_id: params[:id]).page(params[:page]).per(20).order("created_at DESC")
    end
  end

  def new
    @children = Category.find(params[:category_id]).children
    respond_to do |format|
      format.html
      format.json
    end
  end

end
