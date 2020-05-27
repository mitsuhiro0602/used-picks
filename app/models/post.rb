class Post < ApplicationRecord
  belongs_to :item
  accepts_nested_attributes_for :item
end
