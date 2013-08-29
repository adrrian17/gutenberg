require 'test_helper'

class MagazineTest < ActiveSupport::TestCase
  should validate_presence_of(:title)
  should validate_presence_of(:volume)
  should validate_presence_of(:published_date)
  should validate_presence_of(:copies)
  should validate_numericality_of(:copies).is_greater_than(0)
  should belong_to(:category)
  should belong_to(:item_types)
  should have_many(:loans)
end
