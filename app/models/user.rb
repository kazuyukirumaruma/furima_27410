class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_NAME = /\A[ぁ-んァ-ン一-龥]/
  VALID_KANA_NAME = /\A[ァ-ヶー－]+\z/

   validates :password, presence: true, length: {minimum: 6}, format: { with: VALID_PASSWORD }, confirmation: true
   validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}
   validates :nickname, presence: true
   validates :firstname, presence: true, format: { with: VALID_NAME }
   validates :lastname, presence: true, format: { with: VALID_NAME }
   validates :kana_first, presence: true, format: { with: VALID_KANA_NAME }
   validates :kana_last, presence: true, format: { with: VALID_KANA_NAME }
   validates :birthday, presence: true
end
