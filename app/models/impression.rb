class Impression < ApplicationRecord
  belongs_to :book
  has_many :notices, dependent: :destroy

  validates :note, length: { maximum: 300, message: "300 文字以下で入力してください" }
  validates :read_day,
            inclusion: { in: ["1日",
                              "2日〜3日",
                              "1週間",
                              "2週間〜4週間",
                              "1ヶ月以上"] }
  validates :interest,
            :impressed,
            :awareness,
            :impact,
            :practice,
            :knowledge,
            :rating,
            inclusion: { in: ["５点",
                              "４点",
                              "３点",
                              "２点",
                              "１点"] }
  validates :reread_timing,
            inclusion: { in: ["知識を付けたい時",
                              "モチベーションをあげたい時",
                              "なにか決断をする時",
                              "ストレスが溜まっている時",
                              "落ち込んでいる時",
                              "失恋した時",
                              "気分転換したい時",
                              "リラックスしたい時",
                              "特になし"] }

  enum read_day: {
    "-----": 0,
    "1日": 1,
    "2日〜3日": 2,
    "1週間": 3,
    "2週間〜4週間": 4,
    "1ヶ月以上": 5
  }, _prefix: true

  enum interest: {
    "-----": 0,
    "５点": 5,
    "４点": 4,
    "３点": 3,
    "２点": 2,
    "１点": 1
  }, _prefix: true

  enum impressed: {
    "-----": 0,
    "５点": 5,
    "４点": 4,
    "３点": 3,
    "２点": 2,
    "１点": 1
  }, _prefix: true

  enum awareness: {
    "-----": 0,
    "５点": 5,
    "４点": 4,
    "３点": 3,
    "２点": 2,
    "１点": 1
  }, _prefix: true

  enum impact: {
    "-----": 0,
    "５点": 5,
    "４点": 4,
    "３点": 3,
    "２点": 2,
    "１点": 1
  }, _prefix: true

  enum practice: {
    "-----": 0,
    "５点": 5,
    "４点": 4,
    "３点": 3,
    "２点": 2,
    "１点": 1
  }, _prefix: true

  enum knowledge: {
    "-----": 0,
    "５点": 5,
    "４点": 4,
    "３点": 3,
    "２点": 2,
    "１点": 1
  }, _prefix: true

  enum rating: {
    "-----": 0,
    "５点": 5,
    "４点": 4,
    "３点": 3,
    "２点": 2,
    "１点": 1
  }, _prefix: true

  enum reread_timing: {
    "-----": 0,
    "知識を付けたい時": 1,
    "モチベーションをあげたい時": 2,
    "なにか決断をする時": 3,
    "ストレスが溜まっている時": 4,
    "落ち込んでいる時": 5,
    "失恋した時": 6,
    "気分転換したい時": 7,
    "リラックスしたい時": 8,
    "特になし": 9
  }, _prefix: true
end
