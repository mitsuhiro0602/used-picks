class AddReferencesToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :user, null: false, foregin_key: true
    add_reference :items, :brand, foregin_key: true
    add_reference :items, :category, foregin_key: true
    add_reference :items, :item_state, foregin_key: true
    add_reference :items, :measure, foregin_key: true
  end
end
