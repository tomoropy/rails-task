class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comment, dependent: :destroy
  validates :text, presence: true, length: {maximum: 140}
end
