class CreatePublishingHouses < ActiveRecord::Migration
  def change
    create_table :publishing_houses do |t|
      t.string :publishing_house

      t.timestamps
    end
  end
end
