class Shipping < ApplicationRecord
  belongs_to :user, optional: true

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_kana, presence: true
  validates :last_kana, presence: true
  validates :pastal_code, presence: true
  validates :prefectures, presence: true
  validates :city, presence: true
  validates :address, presence: true
end
