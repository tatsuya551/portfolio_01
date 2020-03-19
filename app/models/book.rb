class Book < ApplicationRecord
  belongs_to :user
  has_many :impressions, dependent: :destroy
  has_many :notices, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :author, presence: true
  validates :publisher, presence: true
  validates :status, presence: true
  validates :buy_date, presence: true
  validates :buy_date, date: true, allow_blank: true
  validates :category,
            inclusion: { in: ["小説",
                              "経営・戦略",
                              "政治・経済",
                              "金融・ファイナンス",
                              "IT",
                              "自己啓発",
                              "タレント本",
                              "その他"] }

  enum category: {
    "-----": 0,
    "小説": 1,
    "経営・戦略": 2,
    "政治・経済": 3,
    "金融・ファイナンス": 4,
    "IT": 5,
    "自己啓発": 6,
    "タレント本": 7,
    "その他": 8
  }, _prefix: true

  enum status: {
    "book_impression_none": 0,
    "book_impression_exist": 1,
    "book_following": 2,
  }, _prefix: true

  def book_read
    self.status = "book_impression_exist"
    save
  end

  def book_impression_none
    self.status = "book_impression_none"
    save
  end

  def book_following(book, user)
    self.user_id = user.id
    self.status = "book_following"
    self.buy_date = Date.today
    self.image = book.image.file
    save
  end

  def self.search(search)
    return " " unless search

    Book.where('title LIKE(?)', "%#{search}%")
        .or(
          Book.where('author LIKE(?)', "%#{search}%")
        )
        .or(
          Book.where('publisher LIKE(?)', "%#{search}%")
        )
  end
end
