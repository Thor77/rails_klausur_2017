class Database < ApplicationRecord
  has_and_belongs_to_many :hosts
  has_and_belongs_to_many :users
end
