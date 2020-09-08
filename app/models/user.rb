class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  with_options presence: true do
    validates :nickname
    validates :birthday
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i.freeze
    validates :password, format: { with: PASSWORD_REGEX, message: 'is invalid. Input Input both letters and numbers.' }
    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
    with_options format: { with: NAME_REGEX, message: 'is invalid. Input full-width characters.' } do
      validates :first_name
      validates :last_name
    end
    NAME_READING_REGEX = /\A[ァ-ヶー－]+\z/.freeze
    with_options format: { with: NAME_READING_REGEX, message: 'is invalid. Input full-width katakana characters.'} do
      validates :first_name_reading
      validates :last_name_reading
    end
  end
end
