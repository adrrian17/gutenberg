class Category < ActiveRecord::Base
  validates :category, :slug, uniqueness: { case_sensitive: false }
  validates :category, :slug, presence: true

  has_many :books
  has_many :magazines

  def to_param
    slug
  end  
end
