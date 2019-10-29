class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  # has_many :likes
  # has_many :comments
  # has_many :reviews
  belongs_to :user
  # belongs_to :category
  # belongs_to :size
  # belongs_to :brand
end
