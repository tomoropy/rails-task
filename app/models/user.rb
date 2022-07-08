class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable, :rememberable

  has_one :profile, dependent: :destroy
  has_many :tweet, dependent: :destroy
  has_many :comment, dependent: :destroy

  delegate :name, :profile_text, :image, to: :profile, allow_nil: true

  def soft_delete  
    update_attribute(:deleted_at, Time.current)  
  end

  # ユーザーのアカウントが有効であることを確認 
  def active_for_authentication?  
    super && !deleted_at  
  end  

  # 削除したユーザーにカスタムメッセージを追加します  
  def inactive_message   
    !deleted_at ? super : :deleted_account  
  end 
end
