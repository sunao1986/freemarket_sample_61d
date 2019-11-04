class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  # has_many :likes
  # has_many :comments
  # has_many :reviews
  belongs_to :user, optional: true
  # belongs_to :category
  # belongs_to :size
  # belongs_to :brand
end
