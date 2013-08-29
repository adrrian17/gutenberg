class Magazine < ActiveRecord::Base
	validates :copies, :published_date, :title, :volume, presence: true
	validates :copies, numericality: { only_integer: true, greater_than: 0 }

  belongs_to :category
	belongs_to :item_types
	has_many :loans, foreign_key: :item_id
end
