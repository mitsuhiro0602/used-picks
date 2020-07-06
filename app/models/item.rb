class Item < ApplicationRecord
  # アソシエーション
  has_many :images, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :category, optional: true
  belongs_to :brand, optional: true
  belongs_to :day, optional: true
  belongs_to :size, optional: true
  belongs_to :measure, optional: true
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :brand
  accepts_nested_attributes_for :measure, allow_destroy: true

  # バリデーション
  validates :name,                presence: true
  validates :description,         presence: true
  validates :category_id,         presence: true

  def previous
    Item.where("id < ?", self.id).order("id DESC").first
  end

  def next
    Item.where("id > ?", self.id).order("id ASC").first
  end

  def liked_by(users)
    Like.find_by(user_id: user.id, item_id: id)
  end

  def self.search(name)
    return Item.all() unless name
    Item.where('name LIKE ?', "%#{name}%")
  end

end
