class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :comments
  belongs_to :user, optional: true
  belongs_to :category, optional: true
  belongs_to :size, optional: true
  belongs_to :brand, optional: true

  scope :recent, -> { order('created_at DESC').limit(10)}
end