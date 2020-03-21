FactoryBot.define do
  factory :impression do
    book
    note                  {"最高に面白い！また読みたい本です。"}
    read_day              {"two_three_days"}
    interest              {"five_points"}
    impressed             {"five_points"}
    awareness             {"five_points"}
    impact                {"five_points"}
    practice              {"five_points"}
    knowledge             {"five_points"}
    rating                {"five_points"}
    reread_timing         {"knowledge"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end