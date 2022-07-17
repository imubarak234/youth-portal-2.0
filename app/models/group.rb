class Group < ApplicationRecord
  belongs_to :user
  has_many :members
  has_many :documents

  validates :user, uniqueness: true
end
