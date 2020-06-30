# UsedPicks

古着をメルカリで売るための支援アプリ

# Description

古着をメルカリで売るために効率化、
出品数、売り上げ管理をするアプリです。

# 本番環境
http://54.199.93.45

テストユーザー
ID:test1@gmail.com
パスワード:qazwsxe

# Features
・メインページの表示
・ユーザー登録
・古着の出品、一覧表示、詳細表示
・カテゴリー別で古着の一覧を検索
・キーワード別で古着の一覧を検索
・レスポンシブル対応
・日別、週別、月別の出品数のグラフ表示
・日別、週別、月別の売り上げ金額のグラフ表示
・カレンダー機能の実装
・定型文挿入機能
・いいね、コメント機能



## Dependency

| 種別       | 名称                         |
| -------- | -------------------------- |
| 開発言語     | Ruby(ver 2.5.2)            |
| フレームワーク  | Ruby on Rails(ver 5.0.7.2) |
| マークアップ   | HTML(Haml),CSS(Saas)       |
| フロントエンド  | Javascript(jQuery)         |
| DB       | MYSQL                      |
| 本番環境     | AWS EC2                    |
| 画像アップロード | carrierwave, AWS S3        |
| 自動デプロイ   | capistrano                 |
| ユーザー管理   | devise                     |
| グラフ表示    | chart.js                   |
| カレンダー表示  | fullcalender               |


## ER図
https://app.diagrams.net/?state=%7B%22folderId%22:%221ipSeMsnmdo2h9GrQx9VWau4VNBZIYyeB%22,%22action%22:%22create%22,%22userId%22:%22112328532593405325388%22%7D#G1HQJM-M4i9JAWvyWZ6qhb9tvBBUzw1Qit

## usersテーブル

| Column          | Type    | Options                             |
| --------------- | ------- | ----------------------------------- |
| nickname        | string  | null: false,limit: 20               |
| email           | string  | null: false, unique: true           |
| password        | strinfg | null: false, unique: true           |

### Association

- has_many :items, dependent: :destroy
- has_one  :address

## itemsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name       | string     | null: false                    |
| image      | string     | null: false                    |
| post       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |
| day        | references | null: false, foreign_key: true |
| price      | references | null: false, foreign_key: true |
| brand      | references | null: false, foreign_key: true |
| category   | references | null: false, foreign_key: true |
| item_state | references | null: false, foreign_key: true |
| size       | references | null: false, foregin_key: true |
| measure    | references | null: false, foregin_key: true |
| tag        | references | null: false, foregin_key: true |


### Association
- belongs_to :user
- belongs_to :day
- has_many :images, dependent: :destroy
- has_many :tags
- belongs_to :brand
- belongs_to :size
- belongs_to :measure
- belongs_to :item_state
- belongs_to :price

## categoriesテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| ancestry    | integer    | null: false                    |

### Association
- has_many :items, through: :category_items, dependent: :destroy
- belongs_to :size
- belongs_to :measure
- belongs_to :parent, class_name: :Category
- has_many :children, class_name: :Category, foreign_key: :parent_id
- has_ancestry

## imagesテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foregin_key: true |
| image_url | string     | null: false                    |

### Association
- belongs_to :item

## postsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| title   | string     | null: false                    |
| content | string     | null: false                    |
| item    | references | null: false, foregin_key: true |
| brand   | references | null: false, foregin_key: true |

### Association
- belongs_to :item
- belongs_to :brand
- has_many :tags

## daysテーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| exhibit_day | string | null: false |
| soldout_day | string | null: false |

### Association
- has_many :items

## pricesテーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| initial_price | integer | null: false |
| soldout_price | integer | null: false |

### Association
- belongs_to :item

## brandsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| brand_name      | string     | null: false                    |
| brand_name_kana | string     |                                |

### Association
- has_many :items
- has_many :posts
- has_many :tags

## categoriesテーブル

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| name      | string  | null: false |
| ancestry | integer | null: false |

### Association
- belongs_to :parent, class_name: :Category
- has_many :children, class_name: :Category, foreign_key: :parent_id
- has_many :sizes, through: :category_sizes
- has_many :category_sizes
- has_ancestry

## item_statesテーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| state    | string  | null: false |

### Association
- has_many :items

## category_sizesテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| category | references | null: false, foreign_key: true |
| size     | references | null: false, foregin_key: true |

### Association
- belongs_to :category
- belongs_to :size

## sizesテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| size     | string     | null: false                    |
| ancestry | integer    | null: false                    |

### Association
- has_many :category_sizes
- has_many :sizes, through: :category_sizes
- has_many :items

## category_measuresテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| category | references | null: false, foreign_key: true |
| measure  | references | null: false, foregin_key: true |

### Association
- belongs_to :category
- belongs_to :measure

## measuresテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| shwidth    | string     |                                |
| sllength   | string     |                                |
| length     | string     |                                |
| bustlength | string     |                                |
| west       | string     |                                |
| tolength   | string     |                                |
| inseam     | string     |                                |
| ancestry   | integer    | null: false                    |

### Association
- has_many :category_measures
- has_many :measures, through: :category_measures
- has_many :category_measures
- has_many :items
- has_many :posts

## tagsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| color  | string     | null: false                    |
| brand  | references | null: false, foregin_key: true |
| hash1  | string     |                                |
| hash2  | string     |                                |
| hash3  | string     |                                |
| hash4  | string     |                                |
| hash5  | string     |                                |

### Association
- belongs_to :item
- belongs_to :post
- belongs_to :brand