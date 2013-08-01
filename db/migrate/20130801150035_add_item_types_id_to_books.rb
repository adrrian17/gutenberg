class AddItemTypesIdToBooks < ActiveRecord::Migration
  def change
    change_table(:books) do |t|
      t.integer :item_types_id
    end
  end
end
