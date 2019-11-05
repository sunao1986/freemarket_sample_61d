class Item < ApplicationRecord
  has_many :images
  accepts_nested_attributes_for :images
  # has_many :likes
  # has_many :comments
  # has_many :reviews
  belongs_to :user, optional: true
  belongs_to :category, optional: true
  belongs_to :size, optional: true
  belongs_to :brand, optional: true
end
