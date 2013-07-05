class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.integer :subcategory_id
      t.string :subcategory
      t.integer :category_id

      t.timestamps
    end
  end
end
