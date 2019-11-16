class CommentsController < ApplicationController
 
  def create
    comment = Comment.create(text: params[:text], item_id: params[:item_id], user_id: current_user.id)
    redirect_to "/items/#{comment.item.id}"
  end

  def destroy
  end

  private

  def comment_params
    @comment = params.permit(:text, :item_id)
  end
end
