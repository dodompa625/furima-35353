class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
    has_many :products
    has_many :orders
  

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :password, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/}
    validates :password_confirmation
  end

  with_options format: {with: /\A[ぁ-んァ-ン一-龥]/} do
    validates :first_name
    validates :last_name
  end

  with_options format: {with: /\A[ァ-ヶー－]+\z/} do
    validates :first_name_kana
    validates :last_name_kana
  end

end
