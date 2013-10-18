require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  
  test "should return author's full name" do
    author = authors(:one)

    assert author.full_name == 'John Smith'
  end

  test "should have slug set" do
    author = authors(:one)

    assert_equal 'john-smith', author.slug
  end
end
