# frozen_string_literal: true

module NoticeDecorator
  def days_elapsed
    keika_nissu = (Date.today - date).to_i
    if keika_nissu == 0
      "今日"
    else
      keika_nissu.to_s + "日前"
    end
  end

  def news_text
    "#{user.nickname}さんが#{content}"
  end

  def history_text
    "「#{book.title}」を読書した"
  end
end
