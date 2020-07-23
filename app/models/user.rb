class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   validates :password, presence: true, length: {miniimum: 6}
   validates :email, presence: true, uniqueness: true 
   validates :nickname, presence: true
   validates :firstname, presence: true
   validates :lastname, presence: true
   validates :kana_first, presence: true
   validates :kana_last, presence: true
   validates :birthday, presence: true
end
