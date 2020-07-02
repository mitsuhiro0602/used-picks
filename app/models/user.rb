class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :items, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments
  has_many :like_items, through: :likes, source: :item
  validates :nickname, presence: true, length: { maximum: 20 }

  # ユーザーが既にいいねしているかどうかを判定する
  def already_liked?(item)
    self.likes.exists?(item_id: item.id)
  end
end
