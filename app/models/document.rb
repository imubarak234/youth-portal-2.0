class Document < ApplicationRecord
  belongs_to :user
  belongs_to :group

  has_one_attached :group_document
end
