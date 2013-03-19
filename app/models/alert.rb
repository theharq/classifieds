class Alert < ActiveRecord::Base
  attr_accessible :email, :keywords

  validates :email, presence: true, uniqueness: true
  validates :keywords, presence: true
end
