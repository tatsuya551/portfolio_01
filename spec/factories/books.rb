FactoryBot.define do
  factory :book do
    user
    title              {"テスト"}
    author             {"テスト 太郎"}
    publisher          {"テスト出版"}
    status             {"book_impression_none"}
    buy_date           {"2020-01-22"}
    category           {"novel"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end