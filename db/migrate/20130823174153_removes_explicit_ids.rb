class RemovesExplicitIds < ActiveRecord::Migration
  def change
    remove_column :authors, :author_id
    remove_column :books, :book_id
    remove_column :categories, :category_id
    remove_column :item_types, :item_type_id
    remove_column :loans, :loan_id
    remove_column :magazines, :magazine_id
    remove_column :users, :user_id
  end
end
