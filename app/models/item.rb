class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :comments
  belongs_to :user, optional: true
  belongs_to :category, optional: true
  belongs_to :size, optional: true
  belongs_to :brand, optional: true

  validates :name, presence: true, length: { maximum: 40 }
  validates :discription, presence: true, length: { maximum: 1000 }
  validates :status, presence: true
  validates :delivery_cost, presence: true
  validates :delivery_method, presence: true
  validates :delivery_area, presence: true
  validates :delivery_days, presence: true
  validates :price, presence: true
  validates :category_id, presence: true
  validates :size_id, presence: true
  validates :user_id, presence: true
  
  scope :recent, -> { order('created_at DESC').limit(10)}
end