class Category < ActiveRecord::Base
  has_many :classifieds, dependent: :destroy
  belongs_to :section
  attr_accessible :name, :url, :section_id

  validates :name, presence: true
  validates :url, presence: true
end
