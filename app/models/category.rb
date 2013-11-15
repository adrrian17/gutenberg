class Category < ActiveRecord::Base
  validates :category, :slug, uniqueness: { case_sensitive: false }
  validates :category, presence: true

  has_many :books
  has_many :magazines

  before_save :set_slug

  def set_slug
    self.slug = self.category.parameterize
  end

  def to_param
    slug
  end  
end
