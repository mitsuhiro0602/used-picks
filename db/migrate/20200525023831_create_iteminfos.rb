class CreateIteminfos < ActiveRecord::Migration[5.0]
  def change
    create_table :iteminfos do |t|
      t.string :soldout_day
      t.integer :soldout_price
      t.references :item
      t.timestamps
    end
  end
end
