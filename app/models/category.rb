class Category < ApplicationRecord
  has_many :items
  has_many :category_sizes
  has_many :sizes, through: :category_sizes
  has_many :category_measures
  has_many :measures, thorugh: :category_measures
  has_ancestry
end
