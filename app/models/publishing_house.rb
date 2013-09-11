class PublishingHouse < ActiveRecord::Base
  validates :publishing_house, uniqueness: { case_sensitive: false }
  validates :publishing_house, :slug, presence: true

  has_many :books

  def to_param 
    slug
  end
end
