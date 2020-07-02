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
            inclusion: { in: ["novel",
                              "management",
                              "economy",
                              "finance",
                              "it",
                              "motivation",
                              "talent",
                              "etc"] }

  enum category: {
    "-----": 0,
    novel: 1,
    management: 2,
    economy: 3,
    finance: 4,
    it: 5,
    motivation: 6,
    talent: 7,
    etc: 8
  }, _prefix: true

  enum status: {
    book_impression_none: 0,
    book_impression_exist: 1,
    book_following: 2
  }, _prefix: true

  scope :impression_none, -> { where(status: "book_impression_none") }
  scope :impression_exist, -> { where(status: "book_impression_exist") }
  scope :book_following, -> { where(status: "book_following") }
  scope :no_book_following, -> { where.not(status: "book_following") }
  scope :exclude_user, ->(ids) { where.not(user_id: ids) }
  scope :sorted, -> { order("created_at DESC") }

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

    self.where('title LIKE(?)', "%#{search}%")
        .or(
          self.where('author LIKE(?)', "%#{search}%")
        )
        .or(
          self.where('publisher LIKE(?)', "%#{search}%")
        )
  end
end
