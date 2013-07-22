class CreateAuthorsBooks < ActiveRecord::Migration
  def change
    create_table :authors_books do |t|
      t.integer :author_id
      t.string :book_id

      t.timestamps
    end
  end
end
