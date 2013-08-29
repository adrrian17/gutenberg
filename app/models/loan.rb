class Loan < ActiveRecord::Base
  validates :user_id, :item_id, :item_type_id, presence: true
  validates :user_id, :item_id, :item_type_id, numericality: { only_integer: true }
  belongs_to :user
  belongs_to :item_type

  validate :current_loan_cannot_exists
  PENALTY_PER_DAY = 5.00

  before_save do |loan|
    item = loan.solicited_item
    item.copies -= 1
    item.save
  end

  def in_time?
    (Time.now - self.created_at).to_i < 1.month
  end

  def delayed?
    !in_time?
  end

  def delayed_days
    (Time.now - self.created_at - 1.month).to_i / 60 / 60 / 24
  end

  def penalty
    PENALTY_PER_DAY * delayed_days
  end

  def solicited_item
    if self.item_type_id == 0
      Book.find(self.item_id)
    elsif self.item_type_id == 1
      Magazine.find(self.item_id)
    end
  end

  def save
    super if self.solicited_item.copies > 0
  end

  private
    def current_loan_cannot_exists
      query = {
        user_id: self.user_id, 
        item_id: self.item_id,
        item_type_id: self.item_type_id,
        returned_at: nil
      }
      if Loan.exists?(query)
        errors.add(:id, 'entity can not be repeated')
      end
    end
end
