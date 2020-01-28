FactoryBot.define do
  factory :notice do
    user
    book
    impression
    content       {"新しい本を登録しました"}
    date          {"2020-01-28"}
    status        {"0"}
  end
end
