class Magazine < ActiveRecord::Base
  validates :copies, :published_date, :title, :volume, presence: true
  validates :copies, numericality: { only_integer: true }
  belongs_to :item_types
  has_many :loans, foreign_key: :item_id

  before_save { |magazine| magazine.item_types_id = 1 }
end
