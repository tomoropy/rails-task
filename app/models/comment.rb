class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  has_many :likes, as: :likable

  include Liked

  validates :text, presence: true, length: {maximum: 140}
end
