class RemovesImplicitsIdsFromIntermediateTables < ActiveRecord::Migration
  def change
    remove_column :authors_books, :id
    remove_column :magazines_users, :id
    remove_column :books_users, :id
  end
end
