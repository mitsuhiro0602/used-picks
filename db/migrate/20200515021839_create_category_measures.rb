class CreateCategoryMeasures < ActiveRecord::Migration[5.0]
  def change
    create_table :category_measures do |t|
      t.references :category, foreign_key: true
      t.references :measure, foreign_key: true
      t.timestamps
    end
  end
end
