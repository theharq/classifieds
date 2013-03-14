class Classified < ActiveRecord::Base

  belongs_to :category

  attr_accessible :content

  validates :content, presence: true
  validates :content, uniqueness: true
end
