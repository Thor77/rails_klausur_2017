class Environment < ApplicationRecord
  validates :name, presence: true
end
