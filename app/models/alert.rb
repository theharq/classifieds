class Alert < ActiveRecord::Base
  belongs_to :category
  attr_accessible :email, :keywords, :category_id

  validates :email, presence: true, uniqueness: true
  validates :keywords, presence: true
end
