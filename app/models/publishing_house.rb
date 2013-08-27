class PublishingHouse < ActiveRecord::Base
  validates :publishing_house, uniqueness: { case_sensitive: false }, presence: true

  has_many :books
end
