class Image < ApplicationRecord
  validates :image_url, presence: true
  belongs_to :item, optional: true
  mount_uploader :image_url, ImageUploader
end
