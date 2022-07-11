class Group < ApplicationRecord
  belongs_to :user
  has_many :members

  validates :user_id, uniqueness: { scope: :group_id }
end
