class User < ApplicationRecord
  has_many_and_belongs_to_many :users
end
