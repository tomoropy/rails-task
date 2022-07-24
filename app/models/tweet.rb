class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comment, dependent: :destroy
  has_many :likes, as: :likable

  include Liked

  validates :text, presence: true, length: {maximum: 140}

  #検索機能
  def self.looks(word)
    @tweet = Tweet.where("text Like?", "%#{word}%")
  end
end
