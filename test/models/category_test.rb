require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  should validate_presence_of(:category)
  should validate_uniqueness_of(:category)
  should validate_uniqueness_of(:slug)

  test "should have slug set" do
    category = categories(:one)

    assert_equal 'ciencia-ficcion', category.slug
  end
end
