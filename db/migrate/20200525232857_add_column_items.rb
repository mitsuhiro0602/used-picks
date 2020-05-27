class AddColumnItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :exhibit_day, :date
    add_column :items, :initial_price, :integer
    add_column :items, :description, :string
  end
end
