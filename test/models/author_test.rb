require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  test "should return author's full name" do
    author = authors(:one)

    assert author.full_name != ''
  end
end
