class Classified < ActiveRecord::Base
  attr_accessible :content

  validates :content, presence: true
  validates :content, uniqueness: true
end
