class Group < ApplicationRecord
  belongs_to :user
  has_many :members

  validates :user, uniqueness: true
end
