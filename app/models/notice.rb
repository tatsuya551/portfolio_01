class Notice < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :impression, optional: true

  def notice_book_followers(user, book)
    self.user_id = user.id
    self.book_id = book.id
    self.content = "新しい本を登録しました"
    self.date = Date.today
    self.status = 0
    self.save
  end

  def notice_impression_followers(user, impression)
    self.user_id = user.id
    self.book_id = impression.book_id
    self.impression_id = impression.id
    self.content = "新しい読書感想を登録しました"
    self.date = Date.today
    self.status = 1
    self.save
  end
end
