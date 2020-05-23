class Item < ApplicationRecord
  # アソシエーション
  has_many :images
  has_many :tags, through: :item_tags
  has_many :item_tags, dependent: :destroy
  belongs_to :user
  belongs_to :category, optional: true
  belongs_to :brand, optional: true
  belongs_to :day, optional: true
  belongs_to :size, optional: true
  belongs_to :measure, optional: true
  belongs_to :post
  belongs_to :price
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :brand
  accepts_nested_attributes_for :day
  accepts_nested_attributes_for :price
  accepts_nested_attributes_for :measure
  # accepts_nested_attributes_for :post

  # バリデーション
  validates :name, presence: true


end
