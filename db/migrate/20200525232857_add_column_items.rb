class AddColumnItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :exhibit_day, :date
    add_column :items, :initial_price, :integer
    add_column :items, :description, :string
    add_column :items, :material, :string
    add_column :items, :soldout_day, :date, null: true
    add_column :items, :soldout_price, :integer, null: true
  end
end
