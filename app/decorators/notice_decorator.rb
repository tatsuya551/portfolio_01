# frozen_string_literal: true

module NoticeDecorator
  def days_elapsed
    keika_nissu = (Date.today - date).to_i
    if keika_nissu == 0
      return "今日"
    else
      return keika_nissu.to_s + "日前"
    end
  end

  def news_text
    "#{user.nickname}さんが#{content}"
  end
end
