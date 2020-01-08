class Book < ApplicationRecord
  belongs_to :user
  has_many :impressions

  mount_uploader :image, ImageUploader

  validates :category,
    inclusion: {in: ["小説",
                     "経営・戦略",
                     "政治・経済",
                     "金融・ファイナンス",
                     "IT",
                     "自己啓発",
                     "タレント本",
                     "その他"],
               }
    enum category: {
      "-----":             0,
      "小説":               1,
      "経営・戦略":          2,
      "政治・経済":          3,
      "金融・ファイナンス":   4,
      "IT":                5,
      "自己啓発":            6,
      "タレント本":          7,
      "その他":             8,
    }, _prefix: true

    def book_read
      self.status = 1
    end

    def book_impression_none
      self.status = 0
    end

    def self.search(search)
      return " " unless search
      Book.where('title LIKE(?)', "%#{search}%")
      .or(
      Book.where('author LIKE(?)', "%#{search}%"))
      .or(
      Book.where('publisher LIKE(?)', "%#{search}%"))
    end
end
