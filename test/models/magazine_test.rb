require 'test_helper'

class MagazineTest < ActiveSupport::TestCase
  should validate_presence_of(:title)
  should validate_presence_of(:volume)
  should validate_presence_of(:published_date)
  should validate_presence_of(:copies)
  should belong_to(:item_types)
  should have_many(:loans)

  test "should have item types id set to one" do
    @magazine = magazines(:one)
    assert_equal 1, @magazine.item_types_id
  end  
end
