class Book < ApplicationRecord
  belongs_to :user
  has_many :impression

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
      "小説":             1,
      "経営・戦略":        2,
      "政治・経済":          3,
      "金融・ファイナンス": 4,
      "IT":              5,
      "自己啓発":          6,
      "タレント本":        7,
      "その他":           8,
    }, _prefix: true
end
