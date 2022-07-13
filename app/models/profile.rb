class Profile < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :name, presence: true, length: {maximum: 10}
  validates :profile_text, presence: true, length: {maximum: 300}
  
end
