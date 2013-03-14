class Newspaper < ActiveRecord::Base
  has_many :sections, dependent: :destroy
  attr_accessible :name, :url

  validates :name, presence: true, uniqueness: true
  validates :url, presence: true
end
