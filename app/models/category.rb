class Category < ActiveRecord::Base
  belongs_to :section
  attr_accessible :name, :url, :section_id

  validates :name, presence: true
  validates :url, presence: true
end
