class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.references :price, fgoreign_key: true
      t.references :post, fgoreign_key: true
      t.references :user, fgoreign_key: true
      t.references :day, fgoreign_key: true
      t.references :brand, fgoreign_key: true
      t.references :category, fgoreign_key: true
      t.references :item_state, fgoreign_key: true
      t.references :size, fgoreign_key: true
      t.references :measure, fgoreign_key: true
      t.references :tag, fgoreign_key: true
      t.timestamps
    end
  end
end
