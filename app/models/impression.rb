class Impression < ApplicationRecord
  belongs_to :book
  has_many :notices, dependent: :destroy

  validates :note, length: { maximum: 300, message: "300 文字以下で入力してください" }
  validates :read_day,
            inclusion: { in: ["one_day",
                              "two_three_days",
                              "one_week",
                              "two_four_weeks",
                              "one_month_over"] }
  validates :interest,
            :impressed,
            :awareness,
            :impact,
            :practice,
            :knowledge,
            :rating,
            inclusion: { in: ["one_point",
                              "two_points",
                              "three_points",
                              "four_points",
                              "five_points"] }
  validates :reread_timing,
            inclusion: { in: ["knowledge",
                              "motivation",
                              "decision",
                              "stress",
                              "feel_down",
                              "lost_love",
                              "diversion",
                              "relax",
                              "nothing_special"] }

  enum read_day: {
    "-----": 0,
    one_day: 1,
    two_three_days: 2,
    one_week: 3,
    two_four_weeks: 4,
    one_month_over: 5
  }, _prefix: true

  enum interest: {
    "-----": 0,
    one_point: 1,
    two_points: 2,
    three_points: 3,
    four_points: 4,
    five_points: 5
  }, _prefix: true

  enum impressed: {
    "-----": 0,
    one_point: 1,
    two_points: 2,
    three_points: 3,
    four_points: 4,
    five_points: 5
  }, _prefix: true

  enum awareness: {
    "-----": 0,
    one_point: 1,
    two_points: 2,
    three_points: 3,
    four_points: 4,
    five_points: 5
  }, _prefix: true

  enum impact: {
    "-----": 0,
    one_point: 1,
    two_points: 2,
    three_points: 3,
    four_points: 4,
    five_points: 5
  }, _prefix: true

  enum practice: {
    "-----": 0,
    one_point: 1,
    two_points: 2,
    three_points: 3,
    four_points: 4,
    five_points: 5
  }, _prefix: true

  enum knowledge: {
    "-----": 0,
    one_point: 1,
    two_points: 2,
    three_points: 3,
    four_points: 4,
    five_points: 5
  }, _prefix: true

  enum rating: {
    "-----": 0,
    one_point: 1,
    two_points: 2,
    three_points: 3,
    four_points: 4,
    five_points: 5
  }, _prefix: true

  enum reread_timing: {
    "-----": 0,
    knowledge: 1,
    motivation: 2,
    decision: 3,
    stress: 4,
    feel_down: 5,
    lost_love: 6,
    diversion: 7,
    relax: 8,
    nothing_special: 9
  }, _prefix: true

  scope :knowledge, -> { where(reread_timing: "knowledge") }
  scope :motivation, -> { where(reread_timing: "motivation") }
  scope :decision, -> { where(reread_timing: "decision") }
  scope :stress, -> { where(reread_timing: "stress") }
  scope :feel_down, -> { where(reread_timing: "feel_down") }
  scope :lost_love, -> { where(reread_timing: "lost_love") }
  scope :diversion, -> { where(reread_timing: "diversion") }
  scope :relax, -> { where(reread_timing: "relax") }
  scope :sorted, -> { order("created_at DESC") }
  scope :read_count, -> { group(:book_id).order("count(book_id) DESC") }
  scope :read_once, -> { group(:book_id).having("count(book_id) = 1") }
  scope :read_twice, -> { group(:book_id).having("count(book_id) = 2") }
  scope :read_three, -> { group(:book_id).having("count(book_id) >= 3") }
  scope :search_book, ->(ids) { where(book_id: ids) }

  def get_point(item)
    if self[item] == "one_point"
      1
    elsif self[item] == "two_points"
      2
    elsif self[item] == "three_points"
      3
    elsif self[item] == "four_points"
      4
    else
      5
    end
  end

  def self.get_avg_point(item)
    sum_point = 0
    self.all.each do |impression|
      sum_point += impression.get_point(item)
    end
    (sum_point / self.count.to_f).round(2)
  end
end
