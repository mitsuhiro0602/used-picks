class ItemController < ApplicationController

    def index
      @items = Item.includes(:images).order('created_at DESC')
    end

    def step1
      @item = Item.new
      @item.images.new
      @item.build_brand_id
      @category_parent_array = Category.where(ancestry: nil)
    end

    #親カテゴリーが選択された後に動くアクション
    def get_category_children
      #選択された親カテゴリーに紐づく子カテゴリーの配列を取得する
      @category_children = Category.find_by(id: "#{params[:parent_id]}", ancestry: nil).children
    end
    # 子カテゴリーが選択された後に動くアクション
    def get_category_grandchildren
      #選択された子カテゴリーに紐づく孫カテゴリーの配列を取得する
      @category_children = Category.find("#{params[:child_id]}").children
    end

    #孫カテゴリーが選択された後に動くアクション
    def get_size
      selected_grandchild = Category.find("#{params[:grandchild_id]}") #孫カテゴリーを取得する
      if related_size_parent = selected_grandchild.sizes[0] #孫カテゴリーの親と紐づくサイズ（親）があれば取得する
        @sizes = related_size_parent.children #紐づいたサイズ（親）の子供の配列を取得する
      else
        selected_child = Category.find("#{params[:grandchild_id]}").parent #孫カテゴリーの親を取得する
        if related_size_parent = selected_child.sizes[0] #孫カテゴリーの親と紐づくサイズ（親）があれば取得する
          @sizes = related_size_parent.children  #紐づいたサイズ（親）の子供の配列を取得する
        end
      end
    end

    def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to root_path, notice: "出品しました"
      else
        redirect_to step1_item_index, alert: "必須項目を入力してください"
      end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def item_params
      params.require(:item).permit(:name, :price, images_attributes: [:image_url])
    end
end
