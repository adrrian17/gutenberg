class PublishingHouse < ActiveRecord::Base
  validates :publishing_house, uniqueness: { case_sensitive: false }
  validates :publishing_house, presence: true

  has_many :books

  before_save :set_slug

  def set_slug 
    self.slug = self.publishing_house.parameterize
  end

  def to_param 
    slug
  end
end
