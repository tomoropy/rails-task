class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comment, dependent: :destroy
  
  validates :text, presence: true
  validates :text, {length: {maximum: 140}}
end
