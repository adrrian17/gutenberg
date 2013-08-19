require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  should validate_presence_of(:category)
  should validate_uniqueness_of(:category)
end
