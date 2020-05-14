class Host < ApplicationRecord
  belongs_to :environment, optional: true
  has_and_belongs_to_many :databases
  validates :ip, format: { with: /\A(?:[0-9]{1,3}\.){3}[0-9]{1,3}\z/, message: "is invalid" }
  validates :hostname, uniqueness: true
end
