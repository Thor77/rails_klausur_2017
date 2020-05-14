class Environment < ApplicationRecord
  has_many :hosts
  validates :name, presence: true
end
