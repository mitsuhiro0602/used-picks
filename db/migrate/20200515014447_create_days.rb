class CreateDays < ActiveRecord::Migration[5.0]
  def change
    create_table :days do |t|
      t.integer :exhibit_day, null: false
      t.integer :soldout_day
      t.timestamps
    end
  end
end
