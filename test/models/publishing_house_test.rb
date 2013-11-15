require 'test_helper'

class PublishingHouseTest < ActiveSupport::TestCase
  should validate_presence_of(:publishing_house)
  should validate_uniqueness_of(:publishing_house)

  test "should have slug set" do
    publishing_house = publishing_houses(:DeBolsillo)

    assert_equal 'de-bolsillo', publishing_house.slug
  end
end
