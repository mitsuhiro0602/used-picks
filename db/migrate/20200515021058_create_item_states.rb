class CreateItemStates < ActiveRecord::Migration[5.0]
  def change
    create_table :item_states do |t|
      t.string :state
      t.timestamps
    end
  end
end
