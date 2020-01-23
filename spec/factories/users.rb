FactoryBot.define do
  factory :user do
    nickname              {"test"}
    birth_day             {"1987-05-15"}
    password              {"test01"}
    password_confirmation {"test01"}
    sequence(:email) {Faker::Internet.email}
  end
end