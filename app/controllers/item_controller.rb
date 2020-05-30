class ItemController < ApplicationController
  before_action :set_item, only:[:destroy, :show, :edit, :update]

  before_action :set_category, only: [:new, :create, :edit, :update]
  before_action :confirmation, only: [:new, :edit]

    def index
      @items = Item.includes(:images).order('created_at DESC')
    end

    def new
      @item = Item.new
      @item.images.new
      @item.build_brand
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
      @category_grandchildren = Category.find("#{params[:child_id]}").children
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
      tag_list = params[:item][:hash].split(",")
        if @item.save
          @item.save_items(tag_list)
          redirect_to root_path, notice: "出品しました"
        else
          redirect_to new_item_path, alert: "必須項目を入力してください"
        end
    end

    def edit
      @category = @item.category
      @child_categories = Category.where('ancestry = ?', "#{@category.parent.ancestry}")
      @grand_child = Category.where('ancestry = ?', "#{@category.ancestry}")
      @condition_array = Condition.all
      @item.build_brand
      @tag_list = @item.tags.pluck(:hash).join(",")
    end

    def update
      tag_list = params[:item][:hash].split(",")
        if @item.update(item_params)
          @item.save_items(tag_list)
          redirect_to root_path, notice: "編集しました"
        else
          redirect_to edit_item_path, alert: "必須項目を入力してください"
        end
    end

    # 子カテゴリー
    def category_children
      children = Category.find(params[:name]).name
      @category_children = Category.find_by(name: children, ancestry: nil ).children
    end

    # ログイン状態の確認
    def confirmation #ログインしていない場合はユーザー登録に移動
      unless user_signed_in?
        redirect_to user_session_path, alert: "ログインしてください"
      end
    end

    def show
      # if user_signed_in?
      #   @item = Item.find(params[:id])
      #   @user = User.find(@item.seller_id)
      #   @box = Item.order("RAND()").limit(6)
      #   @smallcategory = Category.find(@item.category_id)
      #   @category = @smallcategory.parent # unless Category.find(@item.category_id)
      #   @bigcategory = @category.parent
      #   @brand = Brand.find(@item.brand_id)
      #   @delivery = DeliveryDay.find(@item.delivery_day_id)
      #   @address = Prefecture.find(@item.prefecture_id)
      #   @condition = Condition.find(@item.condition_id)
      #   @postage = Postage.find(@item.postage_id)
      # else
      #   render index
      # end
    end

    def destroy
    end

    private

    def item_params
      params.require(:item).permit(
        :name,
        :category_id,
        :size_id,
        :item_state_id,
        images_attributes: [
          :image_url,
          :_destroy,
          :id
          ],
        brands_attributes: [
          :id,
          :brand_name,
          :brand_name_kana
        ],
        prices_attributes: [
          :id,
          :initial_price,
          :soldout_price
        ],
        days_attributes: [
          :id,
          :exhibit_day,
          :soldout_day
        ],
        measures_attributes: [
          :id,
          :shwidth,
          :sllength,
          :length,
          :bustlength,
          :west,
          :tolength,
          :inseam
        ]
      ).merge(user_id: current_user.id)
    end

    def set_item
      @item = Item.find(params[:id])
      @images = @item.images
    end

    def item_update_params
      params.require(:item).permit(:name, :price, :description, :category_id, :size_id, :brand_id)
    end

    def registered_images_params
      params.require(:registered_images_ids).permit({ids: []})
    end

    def new_image_params
      params.require(:new_images).permit({images: []})
    end

    def set_category
      @category_parent_array = Category.where(ancestry: nil)
    end
end
