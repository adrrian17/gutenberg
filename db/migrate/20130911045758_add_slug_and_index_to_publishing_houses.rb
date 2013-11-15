class AddSlugAndIndexToPublishingHouses < ActiveRecord::Migration
  def change
    add_column :publishing_houses, :slug, :string
    add_index :publishing_houses, :slug
  end
end
