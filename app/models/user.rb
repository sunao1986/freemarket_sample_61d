class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :card
  has_one :shipping
  has_many :items, dependent: :destroy
  # has_many :likes
  # has_many :comments
  # has_many :reviews

end
