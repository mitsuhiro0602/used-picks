class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :hash1
      t.string :hash2
      t.string :hash3
      t.string :hash4
      t.string :hash5
      t.timestamps
    end
  end
end
