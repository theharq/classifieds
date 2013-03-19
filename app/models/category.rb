class Category < ActiveRecord::Base
  has_many :classifieds, dependent: :destroy
  has_many :alerts, dependent: :destroy
  belongs_to :section
  attr_accessible :name, :url, :section_id

  default_scope order('id')

  validates :name, presence: true
  validates :url, presence: true
end
