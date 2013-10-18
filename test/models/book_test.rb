require 'test_helper'

class BookTest < ActiveSupport::TestCase
  should validate_presence_of(:title)
  should validate_presence_of(:published_date)
  should validate_presence_of(:pages)
  should validate_presence_of(:copies)
  should validate_presence_of(:slug)
  should validate_presence_of(:category_id)
  should validate_presence_of(:publishing_house_id)
  should validate_uniqueness_of(:title).scoped_to(:publishing_house_id, :category_id)
  should validate_numericality_of(:pages).is_greater_than(0)
  should validate_numericality_of(:copies).is_greater_than(0)
  should belong_to(:publishing_house)
  should belong_to(:category)
  should belong_to(:item_types)
  should have_many(:loans)

  test "should have many and belongs to" do
    book = books(:xkcd)
    assert_equal 1, book.authors.size
  end

  test "should have item types id set to zero" do
    book = books(:xkcd)
    assert_equal 0, book.item_types_id
  end

  test "should have slug set" do
    book = books(:xkcd)
    assert_equal 'xkcd-the-full-collection', book.slug
  end
end
