class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  VALID_PASSWORD = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_NICK_NAME = /\A[a-zA-Z]+\z/
  VALID_NAME = /\A[ぁ-んァ-ン一-龥]/
  VALID_KANA_NAME = /\A[ァ-ヶー－]+\z/

  with_options presence: true do |s| 

    s.validates :password, length: {minimum: 6}, format: { with: VALID_PASSWORD }, confirmation: true
    s.validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    s.validates :nickname, format: { with: VALID_NICK_NAME }, uniqueness: { case_sensitive: false }
    s.validates :firstname, format: { with: VALID_NAME }
    s.validates :lastname, format: { with: VALID_NAME }
    s.validates :kana_first, format: { with: VALID_KANA_NAME }
    s.validates :kana_last, format: { with: VALID_KANA_NAME }
    s.validates :birthday
  end
end
