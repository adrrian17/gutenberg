require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:email)
  should validate_uniqueness_of(:email)
  should ensure_length_of(:email).is_at_least(6)
  should_not allow_value("funny_email").for(:email)
  should allow_value("a@b.com").for(:email)
  should have_many(:loans)

  test "associations for loans works" do
    user = users(:ana)
    user.loans << loans(:first_loan)
    assert user.save
    refute_equal 0, user.loans.size
  end
end
