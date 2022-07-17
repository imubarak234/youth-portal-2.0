class Member < ApplicationRecord
  belongs_to :group
  belongs_to :user

  has_one_attached :member_card
  has_one_attached :voter_card
end
