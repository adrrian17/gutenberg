class CreateBooksUsers < ActiveRecord::Migration
  def change
    create_table :books_users do |t|
      t.string :book_id
      t.integer :User_id

      t.timestamps
    end
  end
end
