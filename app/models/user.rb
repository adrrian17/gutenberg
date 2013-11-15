class User < ActiveRecord::Base
  VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: { case_sensitive: false }, format: VALID_EMAIL_REGEX, length: { minimum: 6 }
  validates :email, :first_name, :last_name, presence: true

  has_many :loans

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def admin?
    self.is_admin
  end
end
