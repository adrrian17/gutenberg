class PublishingHouse < ActiveRecord::Base
  validates :publishing_house, uniqueness: { case_sensitive: false }, presence: true
end
