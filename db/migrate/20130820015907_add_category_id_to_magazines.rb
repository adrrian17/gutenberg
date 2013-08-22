class AddCategoryIdToMagazines < ActiveRecord::Migration
  def change
    change_table(:magazines) do |t|
      t.integer :category_id
    end
  end
end
