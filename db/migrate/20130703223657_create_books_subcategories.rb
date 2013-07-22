class CreateBooksSubcategories < ActiveRecord::Migration
  def change
    create_table :books_subcategories do |t|
      t.string :book_id
      t.integer :Subcategory_id

      t.timestamps
    end
  end
end
