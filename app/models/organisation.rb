class Organisation < ApplicationRecord
  has_many :users
  has_many :backlogs

  validates :name, presence: true
end
