class ItemController < ApplicationController

    def index
      @items = Item.includes(:images).order('created_at DESC')
    end

    def step1
      @item = Item.new
      @item.images.new
      # @item.build_brand_id
      @category_parent_array = Category.where(ancestry: nil)
    end

    def step2
      @item = Item.new
    end

    def step3
      @item = Item.new
    end


  #   #step1以降のバリデーション追加

  #   def save_step1_to_session
  #     session[:nickname] = user_params[:nickname]
  #     session[:email] = user_params[:email]
  #     session[:password] = user_params[:password]
  #     session[:last_name] = user_params[:last_name]
  #     session[:first_name] = user_params[:first_name]
  #     session[:last_name_kana] = user_params[:last_name_kana]
  #     session[:first_name_kana] = user_params[:first_name_kana]
  #     session[:birth_year] = user_params[:birth_year]
  #     session[:birth_month] = user_params[:birth_month]
  #     session[:birth_day] = user_params[:birth_day]

  #     # バリデーション用に仮でインスタンスを作成

  #     @item = Item.new(
  #     nickname: session[:nickname], #sessionに保存された値を返す
  #     email: session[:email],
  #     password: session[:password],
  #     last_name: session[:last_name],
  #     first_name: session[:first_name],
  #     last_name_kana: session[:last_name_kana],
  #     first_name_kana: session[:first_name_kana],
  #     birth_year: session[:birth_year],
  #     birth_month: session[:birth_month],
  #     birth_day: session[:birth_day]
  #   )
  #   render action: :step1 unless @user.valid?(:save_step1_to_session)
  #   end

  # #ステップ2以降のバリデーションの追加

  # def save_step2_to_session
  #   session[:tel] = user_params[:tel] #step2で入力された情報をsessionに代入する
  #   # バリデーション用に仮でインスタンスを作成
  #   @user =User.new(
  #     email: session[:email],
  #     password: session[:password],
  #     tel: session[:tel]
  #   )
  #   render '/users/signup/sms' unless @user.valid?(:save_step2_to_session)
  # end


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
