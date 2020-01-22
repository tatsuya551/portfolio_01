FactoryBot.define do
  factory :impression do
    id                    {"1"}
    book
    note                  {"最高に面白い！また読みたい本です。"}
    read_day              {"1週間"}
    interest              {"５点"}
    impressed             {"５点"}
    awareness             {"５点"}
    impact                {"５点"}
    practice              {"５点"}
    knowledge             {"５点"}
    rating                {"５点"}
    reread_timing         {"知識を付けたい時"}
  end
end