class ChangeUsers < ActiveRecord::Migration
  def change
		change_table :users do |t|
		  t.boolean :is_admin
		  t.index :user_id
		  t.rename :firs_name, :first_name
		end
  end
end
