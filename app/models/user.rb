class User < ApplicationRecord
  has_and_belongs_to_many :databases
  alias_attribute :password, :password_digest
  validates :email, presence: true
end
