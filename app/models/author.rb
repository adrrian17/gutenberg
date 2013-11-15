class Author < ActiveRecord::Base
  validates :first_name, :last_name, presence: true

  has_and_belongs_to_many :books

  before_save :set_slug

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def set_slug
    self.slug = self.full_name.parameterize
  end

  def to_param 
    slug
  end
end
