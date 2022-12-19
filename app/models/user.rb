class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_many :consumers
  has_one :card, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :birth, presence: true

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は英字と数字の両方を含んでください' }

  validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角で入力してください' },
                                       presence: true
  validates :family_name_kana, :first_name_kana, format: { with: /\A[ァ-ン]+\z/, message: 'はカタカナで入力してください' },
                                                 presence: true
end
