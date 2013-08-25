require 'test_helper'

class BookTest < ActiveSupport::TestCase
  should validate_presence_of(:title)
  should validate_presence_of(:published_date)
  should validate_presence_of(:pages)
  should validate_presence_of(:copies)
  should validate_uniqueness_of(:title).scoped_to(:publishing_house_id, :category_id)
  should validate_numericality_of(:pages)
  should validate_numericality_of(:copies)
  should belong_to(:publishing_house)
  should belong_to(:category)
  should belong_to(:item_types)
  should have_many(:loans)

  test "should have many and belongs to" do
    book = books(:xkcd)
    author = authors(:one)

    book.authors << author

    assert_equal 1, book.authors.size
  end

  test "should have item types id set to zero" do
    @book = books(:xkcd)
    assert_equal 0, @book.item_types_id
  end
end
