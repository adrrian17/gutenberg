class RemovesSubcategoriesTable < ActiveRecord::Migration
  def change
    drop_table :subcategories
    drop_table :books_subcategories
  end
end
