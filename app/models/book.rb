class Book < ActiveRecord::Base
  validates :title, :published_date, :pages, :copies, presence: true
  validates :pages, numericality: { only_integer: true, greater_than: 0 }
  validates :copies, numericality: { only_integer: true, greater_than: 0 }
  validates :title, uniqueness: { scope: [:publishing_house_id, :category_id] }

  has_many :loans, foreign_key: :item_id
  has_and_belongs_to_many :authors
  belongs_to :category
  belongs_to :item_types
  belongs_to :publishing_house
end
