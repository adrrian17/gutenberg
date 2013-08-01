require 'test_helper'

class BookTest < ActiveSupport::TestCase
  should validate_presence_of(:title)
  should validate_presence_of(:published_date)
  should validate_presence_of(:pages)
  should validate_presence_of(:copies)
  should validate_uniqueness_of(:title).scoped_to(:publishing_house_id, :category_id)
  should validate_numericality_of(:pages)
  should validate_numericality_of(:copies)
  should have_many(:authors)
  should belong_to(:publishing_house)
  should belong_to(:category)
  should belong_to(:item_types)
  should have_many(:loans)
end
