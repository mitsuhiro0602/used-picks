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
    @post.save
    if @post.save
      redirect_to root_path
      flash[:alert] = "作成しました"
    else
      binding.pry
      redirect_to new_post_path
      flash[:alert] = "必要項目を入力してください"
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
      redirect_to edit_post_path, alert: "必要項目を入力してください"
    end
  end

  private

  def post_params
    params.require(:post).permit(
      :title,
      :content
    )
    .merge(user_id: current_user.id)
  end
end
