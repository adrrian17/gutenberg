class User < ActiveRecord::Base
  VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: { case_sensitive: false }, format: VALID_EMAIL_REGEX, length: { minimum: 6 }
  validates :email, :first_name, :last_name, presence: true

  has_many :loans
end
