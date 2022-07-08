class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  validates :text, presence: true
  validates :text, {length: {maximum: 140}}
end
