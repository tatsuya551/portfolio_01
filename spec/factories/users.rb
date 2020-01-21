FactoryBot.define do
  factory :user do
    id                    {"1"}
    nickname              {"test"}
    email                 {"test@gmail.com"}
    birth_day             {"1987-05-15"}
    password              {"test01"}
    password_confirmation {"test01"}
  end
end