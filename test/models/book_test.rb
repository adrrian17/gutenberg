require 'test_helper'

class BookTest < ActiveSupport::TestCase
  should validate_presence_of(:title)
  should validate_presence_of(:published_date)
  should validate_presence_of(:pages)
  should validate_presence_of(:copies)
  should validate_uniqueness_of(:title).scoped_to(:publishing_house_id, :category_id)
  should validate_numericality_of(:pages).is_greater_than(0)
  should validate_numericality_of(:copies).is_greater_than(0)
  should belong_to(:publishing_house)
  should belong_to(:category)
  should belong_to(:item_types)
  should have_many(:loans)

  def test_should_have_many_and_belongs_to
    book = books(:xkcd)
    author = authors(:one)

    book.authors << author

    assert_equal 1, book.authors.size
  end
end
