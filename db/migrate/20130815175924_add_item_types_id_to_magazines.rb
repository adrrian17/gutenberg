class AddItemTypesIdToMagazines < ActiveRecord::Migration
  def change
    change_table(:magazines) do |t|
      t.integer :item_types_id
    end
  end
end
