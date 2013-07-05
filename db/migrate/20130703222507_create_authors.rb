class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.integer :author_id
      t.string :first_name
      t.string :last_name
      t.string :country_id
      t.datetime :born_date

      t.timestamps
    end
  end
end
