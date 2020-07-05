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

  def show_day
    #アイテムカラムを取得する (sold_out_priceに変更、sold_out_dayに変更)
    year_day = []
    # 入力した日にちを保存する
    year_day = params[:exhibit_day]
    binding.pry
    # 配列から月を取り出す
    year_day_int = year_day.split "-"
    @year_day_int = year_day_int[1,2].join('月') + '日' #.to_i
    
    # 文字列から連結する
    year_day_date = year_day + "-1"
    @year_day_date = year_day_date.to_date
    @items = Item.order(exhibit_day: :asc)
    # 月初の日時を取得する
    to = @year_day_date.beginning_of_day
    # 月末の日時を取得する
    from_day = @year_day_date.end_of_day
    # priceの計算(sold_out_priceに変更、sold_out_dayに変更)
    @price_days = Item.where(exhibit_day: to...from_day)
    @price_days_total = @price_days.sum(:initial_price)
    # item_momnthの計算
    @item_days = Item.where(exhibit_day: to...from_day)
    @item_days_total = @item_days.count
  end

  def show_week
    #アイテムカラムを取得する (sold_out_priceに変更、sold_out_dayに変更)
    year_week = []
    # 入力した日にちを保存する
    year_week = params[:exhibit_day]
    
    # 配列から月を取り出す
    year_week_int = year_week.split "-"
    @year_week_int = year_week_int[1].to_i
    
    # 文字列から連結する
    year_week_date = year_week + "-1"
    @year_week_date = year_week_date.to_date
    @items = Item.order(exhibit_day: :asc)
    # 月初の日時を取得する
    to = @year_week_date.beginning_of_week
    # 月末の日時を取得する
    from_week = @year_week_date.end_of_week
    # priceの計算(sold_out_priceに変更、sold_out_dayに変更)
    @price_weeks = Item.where(exhibit_day: to...from_week)
    @price_weeks_total = @price_weeks.sum(:initial_price)
    # item_momnthの計算
    @item_weeks = Item.where(exhibit_day: to...from_week)
    @item_weeks_total = @item_weeks.count
  end

  def show_month
    #アイテムカラムを取得する (sold_out_priceに変更、sold_out_dayに変更)
    year_month = []
    # 入力した日にちを保存する
    year_month = params[:exhibit_day]
    
    # 配列から月を取り出す
    year_month_int = year_month.split "-"
    @year_month_int = year_month_int[1].to_i
    
    # 文字列から連結する
    year_month_date = year_month + "-1"
    @year_month_date = year_month_date.to_date
    @items = Item.order(exhibit_day: :asc)
    # 月初の日時を取得する
    to = @year_month_date.beginning_of_month
    # 月末の日時を取得する
    from_month = @year_month_date.end_of_month
    # priceの計算(sold_out_priceに変更、sold_out_dayに変更)
    @price_months = Item.where(exhibit_day: to...from_month)
    @price_months_total = @price_months.sum(:initial_price)
    # item_momnthの計算
    @item_months = Item.where(exhibit_day: to...from_month)
    @item_months_total = @item_months.count
  end

  def show_year
    #アイテムカラムを取得する (sold_out_priceに変更、sold_out_dayに変更)
    year_input = []
    # 入力した日にちを保存する
    year_input = params[:exhibit_day]
    @year_input_int = year_input
    year_input_date = year_input + "-01-01"
    @year_input_date = year_input_date.to_date

    @items = Item.order(exhibit_day: :asc) if @items.present?
    to = @year_input_date.beginning_of_year
    from_year = @year_input_date.end_of_year
    @price_years = Item.where(exhibit_day: to...from_year)
    @price_years_total = @price_years.sum(:initial_price)
    @item_years = Item.where(exhibit_day: to...from_year)
    @item_years_total = @item_years.count
  end
end
