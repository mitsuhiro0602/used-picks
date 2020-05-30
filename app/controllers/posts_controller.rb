class PostsController < ApplicationController
  def index
  end

  def new
    #Postモデルのオブジェクト作成
    #@postはインスタンス変数でviewで参照できる
    @post = Post.new
  end



  def edit
  end

  def update
  end
end
