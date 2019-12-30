class Book < ApplicationRecord
  belongs_to :user
  has_many :impression

  mount_uploader :image, ImageUploader
end
