class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # has_many :products
  # has_many :purchases
  

  with_options presence: true do
    validates :nickname
    validates :email
    validates :password,              length:{minimum:6}, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}
    validates :password_confirmation, length:{minimum:6}, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}
    validates :first_name,            format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :first_name_kana,       format: {with: /\A[ァ-ヶー－]+\z/}
    validates :last_name,             format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :last_name_kana,        format: {with: /\A[ァ-ヶー－]+\z/}
    validates :birthday
  end
end
