class AddIndexToItems < ActiveRecord::Migration[5.0]
  def change
    add_index :items, :name, length: 50
    add_index :items, :material, length: 20
  end
end