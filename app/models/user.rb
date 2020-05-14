class User < ApplicationRecord
  has_and_belongs_to_many :databases

  validates :email, presence: true
end
