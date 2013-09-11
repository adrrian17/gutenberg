class Author < ActiveRecord::Base
  validates :first_name, :last_name, :slug, presence: true

  has_and_belongs_to_many :books

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def to_param 
    self.full_name.parameterize
  end
end
