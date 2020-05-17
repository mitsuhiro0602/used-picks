class AddReferencesToPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :item, null: false, foregin_key: true
    add_reference :posts, :brand, foregin_key: true
    add_reference :posts, :measure, foregin_key: true
    add_reference :posts, :tag, foregin_key: true
    add_reference :posts, :color, foregin_key: true
  end
end
