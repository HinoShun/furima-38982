class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders
  
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/, message: "Include both letters and numbers"}

  with_options presence: true do
    validates :nickname
    validates :family_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "Input full-width characters"}
    validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "Input full-width characters"}
    validates :family_name_reading, format: {with: /\A[ァ-ヶー]+\z/, message: "Input full-width katakana characters"}
    validates :first_name_reading, format: {with: /\A[ァ-ヶー]+\z/, message: "Input full-width katakana characters"}
    validates :birthday
  end

end