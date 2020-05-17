class CreateMeasures < ActiveRecord::Migration[5.0]
  def change
    create_table :measures do |t|
      t.integer :shwidth
      t.integer :sllength
      t.integer :length
      t.integer :bustlength
      t.integer :west
      t.integer :tolength
      t.integer :inseam
      t.timestamps
    end
  end
end
