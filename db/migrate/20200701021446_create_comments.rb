class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :comment, null: false
      t.references :item, foregin_key: true, null: false
      t.references :user, foregin_key: true, null: false
      t.timestamps
    end
  end
end
