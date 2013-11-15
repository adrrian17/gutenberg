class Magazine < ActiveRecord::Base
  LOAN_PERIOD = 2.weeks
  validates :copies, :published_date, :title, :volume, presence: true
  validates :copies, numericality: { only_integer: true, greater_than: 0 }
  
  belongs_to :item_types
  belongs_to :category
  has_many :loans, foreign_key: :item_id

  before_save :set_item_type
  before_save :set_slug

  def loan_period
    LOAN_PERIOD
  end

  def set_item_type
    self.item_types_id = 1
  end

  def set_slug
    self.slug = self.title.parameterize
  end

  def to_param
    slug
  end
end
