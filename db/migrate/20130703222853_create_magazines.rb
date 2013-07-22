class CreateMagazines < ActiveRecord::Migration
  def change
    create_table :magazines do |t|
      t.integer :magazine_id
      t.string :title
      t.string :volume
      t.datetime :published_date
      t.integer :copies

      t.timestamps
    end
  end
end
