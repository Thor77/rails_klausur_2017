class Host < ApplicationRecord
  belongs_to :environment
  has_and_belongs_to_many :hosts

  validates :hostname, uniqueness: true
end
