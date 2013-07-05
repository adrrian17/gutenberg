class CreateMagazinesUsers < ActiveRecord::Migration
  def change
    create_table :magazines_users do |t|
      t.integer :magazine_id
      t.integer :user_id

      t.timestamps
    end
  end
end
