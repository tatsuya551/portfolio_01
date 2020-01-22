FactoryBot.define do
  factory :book do
    id                 {"1"}
    user
    title              {"テスト"}
    author             {"テスト 太郎"}
    publisher          {"テスト出版"}
    status             {"0"}
    buy_date           {"2020-01-22"}
    category           {"小説"}
  end
end