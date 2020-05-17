class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.integer :initial_price, null: false
      t.integer :soldout_price
      t.timestamps
    end
  end
end
