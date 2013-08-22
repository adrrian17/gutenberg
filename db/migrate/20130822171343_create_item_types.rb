class CreateItemTypes < ActiveRecord::Migration
  def change
    create_table :item_types do |t|
      t.integer :item_type_id
      t.string :item_type

      t.timestamps
    end
  end
end
