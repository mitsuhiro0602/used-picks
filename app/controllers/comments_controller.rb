class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @item = Item.find(params[:item_id])
    # 投稿に基づいたコメントを作成
    @comment = @item.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to item_path(id: @item.id)
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    redirect_to root_path
  end

  private
    def comment_params
      params.require(:comment).permit(:user_id, :item_id, :comment)
    end
end
