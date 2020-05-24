class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :content, null: false
      t.string :exhibit_day
      t.string :soldout_day
      t.integer :initial_price
      t.integer :soldout_price
      t.timestamps
    end
  end
end
