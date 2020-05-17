class AddAncestryToMeasures < ActiveRecord::Migration[5.0]
  def change
    add_column :measures, :ancestry, :string
    add_index :measures, :ancestry
  end
end
