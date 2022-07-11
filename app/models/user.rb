class User < ApplicationRecord
  has_many :members
  has_one :groups

  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :email, presence: true
end
