class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable, :rememberable

  has_one :profile, dependent: :destroy

  delegate :name, :profile_text, :image, to: :profile
end
