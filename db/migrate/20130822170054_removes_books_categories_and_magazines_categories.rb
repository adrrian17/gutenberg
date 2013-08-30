class RemovesBooksCategoriesAndMagazinesCategories < ActiveRecord::Migration
  def change
    drop_table :Books_categories
    drop_table :Magazines_categories
  end
end
