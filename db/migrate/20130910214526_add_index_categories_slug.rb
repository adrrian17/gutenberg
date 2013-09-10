class AddIndexCategoriesSlug < ActiveRecord::Migration
  def change
    add_index :categories, :slug
  end
end
