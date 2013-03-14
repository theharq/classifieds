class Section < ActiveRecord::Base
  has_many :categories, dependent: :destroy
  belongs_to :newspaper
  attr_accessible :name, :newspaper_id

  validates :name, presence: true
end
