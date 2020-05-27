class ItemTag < ApplicationRecord
    belongs_to :item, optional: true
    belongs_to :tag, optional: true
end
