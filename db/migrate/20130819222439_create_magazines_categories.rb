class CreateMagazinesCategories < ActiveRecord::Migration
  def change
    create_table :magazines_categories do |t|
      t.integer :magazine_id
      t.integer :category_id
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
