class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  has_many :likes, as: :likable

  include Liked

  validates :text, presence: true, length: {maximum: 140}

  #検索機能
  def self.looks(word)
    @comment = Comment.where("text Like?", "%#{word}%")
  end
end
