class Item < ApplicationRecord
  has_many :images
  belongs_to :user
  belongs_to :category, optional: true
  belongs_to :brand, optional: true
  belongs_to :size, optional: true
  belongs_to :measure, optional: true
  accepts_nested_attributes_for :images, allow_destroy: true
end
