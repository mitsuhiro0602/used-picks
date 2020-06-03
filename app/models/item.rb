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
  accepts_nested_attributes_for :measure, allow_destroy: true
  # accepts_nested_attributes_for :post

  # バリデーション
  validates :name, presence: true

  #タグを保存するためのメソッド
  def save_items(tags)
    current_tags = self.tags.pluck(:hash) unless self.tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    #Destroy
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(hash:old_name)
    end

    #create
    new_tags.each do |new_name|
      item_tag = Tag.find_or_create_by(hash:new_name)
      self.tags << item_tag
    end
  end

end
