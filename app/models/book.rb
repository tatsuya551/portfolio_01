class Book < ApplicationRecord
  belongs_to :user
  has_many :impression

  mount_uploader :image, ImageUploader

  def already_read
    self.status = 1
  end
end
