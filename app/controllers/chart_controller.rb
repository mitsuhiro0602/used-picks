class ChartController < ApplicationController
  
  # 確認するのは
  # 年間の出品数、売り上げ
  # 月間の出品数、売り上げ
  # １週間の出品数、売り上げ
  # 1日の出品数、売り上げ

  def index
    
  end

  def show_total
      # 昨日の時間を取得する
    to = Time.current.at_beginning_of_day
    # １週間前の時間を取得する
    from_week = (to - 8.day).at_end_of_day
    # 1ヶ月間の時間を取得する
    from_month = (to - 1.month + 9.day)
    # 1年間の時間を取得する
    from_year = (to - 1.year + 9.day)

    # 1日の売り上げの合計(sold_out_priceに変更、sold_out_dayに変更)
    @day_price = Item.where(exhibit_day: 1.day.ago.all_day).sum(:initial_price)
    # １ヶ月の売り上げの合計
    @month_price = Item.where(exhibit_day: from_month...to).sum(:initial_price)
    # １年間の売り上げの合計
    @year_price = Item.where(exhibit_day: from_year...to).sum(:initial_price)

    # 1日の出品数の合計
    @day_item = Item.where(exhibit_day: 1.day.ago.all_day).count
    # １週間の出品数の合計
    @week_item = Item.where(exhibit_day: from_week...to).count
    # １ヶ月の出品数の合計
    @month_item = Item.where(exhibit_day: from_month...to).count
    # １年間の出品数の合計
    @year_item = Item.where(exhibit_day: from_year...to).count
  end

  def show_month

    #アイテムカラムを取得する (sold_out_priceに変更、sold_out_dayに変更)
    @year_month = params[:exhibit_day]
    @items = Item.order(exhibit_day: :asc)

    # 昨日の時間を取得する
    to = Time.current.at_beginning_of_day
    # １週間前の時間を取得する
    from_week = (to - 8.day).at_end_of_day
    # 1ヶ月間の時間を取得する
    from_month = (to - 1.month + 9.day)
    # 1年間の時間を取得する
    from_year = (to - 1.year + 9.day)

    # priceの計算(sold_out_priceに変更、sold_out_dayに変更)
    @price_months = Item.where(exhibit_day: from_month...to)

    # item_momnthの計算
    @item_months = Item.where(exhibit_day: from_month...to)
  end
end
