class Post < ApplicationRecord
  belongs_to :user
  belongs_to :item, optional: true
end
