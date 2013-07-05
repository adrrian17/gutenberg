class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :book_id
      t.string :title
      t.time :published_date
      t.integer :pages
      t.integer :copies
      t.string :publishing_house_id
      t.string :category_id

      t.timestamps
    end
  end
end
