class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.integer :loan_id
      t.integer :item_type_id
      t.integer :item_id
      t.integer :user_id
      t.datetime "created_at"
      t.datetime "updated_at"      
      t.datetime :returned_at
    end
  end
end
