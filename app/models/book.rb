class Book < ActiveRecord::Base
  validates :title, :published_date, :pages, :copies, presence: true
  validates :pages, numericality: { only_integer: true }
  validates :copies, numericality: { only_integer: true }
  validates :title, uniqueness: { scope: [:publishing_house_id, :category_id] }

  has_many :loans, foreign_key: :item_id
  has_and_belongs_to_many :authors
  belongs_to :category
  belongs_to :item_types
  belongs_to :publishing_house

  before_save { |book| book.item_types_id = 0 }
end
