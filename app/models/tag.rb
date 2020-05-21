class Tag < ApplicationRecord
  has_many :item_tags  
  has_many :items, through: :item_tags
  # accepts_nested_attributes_for :items
end