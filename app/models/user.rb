class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname,:birth, presence: true

  validates :password,format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i,message:'. Include both letters and numbers'}

  validates :family_name,:first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '. Input full-width characters' } , presence: true
  validates :family_name_kana,:first_name_kana, format: { with: /\A[ァ-ン]+\z/, message: '. Input full-width katakana characters'} ,presence: true
end
