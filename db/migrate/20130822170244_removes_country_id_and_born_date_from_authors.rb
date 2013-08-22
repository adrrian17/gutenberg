class RemovesCountryIdAndBornDateFromAuthors < ActiveRecord::Migration
  def change
    change_table :authors do |t|
      t.remove :country_id, :born_date
    end
  end
end
