require 'test_helper'

class PublishingHouseTest < ActiveSupport::TestCase
  should validate_presence_of(:publishing_house)
  should validate_uniqueness_of(:publishing_house)
end
