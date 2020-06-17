class PostsController < ApplicationController
  def index
    @psots = Post.all
  end

  def new
    #Postモデルのオブジェクト作成
    #@postはインスタンス変数でviewで参照できる
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "作成しました"
      binding.pry

      redirect_to root_path
    else
      flash[:alert] = "必要項目を入力してください"
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "投稿を編集しました"
      redirect_to root_path
    else
      flash[:alert] = "必要項目を入力してください"
      redirect_to edit_post_path
    end
  end

  private

  def post_params
    params.require(:post).permit(
      :title,
      :content,
      :item_id
    )
    .merge(user_id: current_user.id)
  end
end
