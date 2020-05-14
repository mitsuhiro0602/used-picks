class ItemController < ApplicationController

    def index
      @items = Item.includes(:images).order('created_at DESC')
    end

    def step1
      @item = Item.new
      @item.images.new
    end

    def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to root_path, notice: "出品しました"
      else
        render :new
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
