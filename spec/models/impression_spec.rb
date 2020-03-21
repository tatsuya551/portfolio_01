require 'rails_helper'

describe Impression, type: :model do
  describe '#create' do
    #############################
    # 保存NG確認                 #
    #############################
    context 'can not save' do
      it "[note] 301byte" do
        impression = build(:impression, note: "abcdefghijklmnoABCDEFGHIJKLMNOabcdefghijklmnoABCDEFGHIJKLMNOabcdefghijklmnoABCDEFGHIJKLMNOabcdefghijklmnoABCDEFGHIJKLMNOabcdefghijklmnoABCDEFGHIJKLMNOabcdefghijklmnoABCDEFGHIJKLMNOabcdefghijklmnoABCDEFGHIJKLMNOabcdefghijklmnoABCDEFGHIJKLMNOabcdefghijklmnoABCDEFGHIJKLMNOabcdefghijklmnoABCDEFGHIJKLMNOa")
        impression.valid?
        expect(impression.errors.messages[:note]).to include("300 文字以下で入力してください")
      end

      it "[read_day] nil" do
        impression = build(:impression, read_day: nil)
        impression.valid?
        expect(impression.errors.messages[:read_day]).to include("を選択してください")
      end

      it "[interest] nil" do
        impression = build(:impression, interest: nil)
        impression.valid?
        expect(impression.errors.messages[:interest]).to include("を選択してください")
      end

      it "[impressed] nil" do
        impression = build(:impression, impressed: nil)
        impression.valid?
        expect(impression.errors.messages[:impressed]).to include("を選択してください")
      end

      it "[awareness] nil" do
        impression = build(:impression, awareness: nil)
        impression.valid?
        expect(impression.errors.messages[:awareness]).to include("を選択してください")
      end

      it "[impact] nil" do
        impression = build(:impression, impact: nil)
        impression.valid?
        expect(impression.errors.messages[:impact]).to include("を選択してください")
      end

      it "[practice] nil" do
        impression = build(:impression, practice: nil)
        impression.valid?
        expect(impression.errors.messages[:practice]).to include("を選択してください")
      end

      it "[knowledge] nil" do
        impression = build(:impression, knowledge: nil)
        impression.valid?
        expect(impression.errors.messages[:knowledge]).to include("を選択してください")
      end

      it "[reread_timing] nil" do
        impression = build(:impression, reread_timing: nil)
        impression.valid?
        expect(impression.errors.messages[:reread_timing]).to include("を選択してください")
      end
    end
    
    #############################
    # 保存OK確認                 #
    #############################
    context 'can save' do
      it "[impression] all ok" do
        impression = build(:impression)
        impression.valid?
        expect(impression).to be_valid
      end

      it "[note] nil" do
        impression = build(:impression, note: nil)
        impression.valid?
        expect(impression).to be_valid
      end

      it "[note] 300byte" do
        impression = build(:impression, note: "abcdefghijklmnoABCDEFGHIJKLMNOabcdefghijklmnoABCDEFGHIJKLMNOabcdefghijklmnoABCDEFGHIJKLMNOabcdefghijklmnoABCDEFGHIJKLMNOabcdefghijklmnoABCDEFGHIJKLMNOabcdefghijklmnoABCDEFGHIJKLMNOabcdefghijklmnoABCDEFGHIJKLMNOabcdefghijklmnoABCDEFGHIJKLMNOabcdefghijklmnoABCDEFGHIJKLMNOabcdefghijklmnoABCDEFGHIJKLMNO")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[read_day] 1日" do
        impression = build(:impression, read_day: "one_day")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[read_day] 2日〜3日" do
        impression = build(:impression, read_day: "two_three_days")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[read_day] 1週間" do
        impression = build(:impression, read_day: "one_week")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[read_day] 2週間〜4週間" do
        impression = build(:impression, read_day: "two_four_weeks")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[read_day] 1ヶ月以上" do
        impression = build(:impression, read_day: "one_month_over")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[interest] ５点" do
        impression = build(:impression, interest: "five_points")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[interest] ４点" do
        impression = build(:impression, interest: "four_points")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[interest] ３点" do
        impression = build(:impression, interest: "three_points")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[interest] ２点" do
        impression = build(:impression, interest: "two_points")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[interest] １点" do
        impression = build(:impression, interest: "one_point")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[impressed] ５点" do
        impression = build(:impression, impressed: "five_points")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[impressed] ４点" do
        impression = build(:impression, impressed: "four_points")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[impressed] ３点" do
        impression = build(:impression, impressed: "three_points")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[impressed] ２点" do
        impression = build(:impression, impressed: "two_points")
        impression.valid?
        expect(impression).to be_valid
      end
      
      it "[impressed] １点" do
        impression = build(:impression, impressed: "one_point")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[awareness] ５点" do
        impression = build(:impression, awareness: "five_points")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[awareness] ４点" do
        impression = build(:impression, awareness: "four_points")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[awareness] ３点" do
        impression = build(:impression, awareness: "three_points")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[awareness] ２点" do
        impression = build(:impression, awareness: "two_points")
        impression.valid?
        expect(impression).to be_valid
      end
      
      it "[awareness] １点" do
        impression = build(:impression, awareness: "one_point")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[impact] ５点" do
        impression = build(:impression, impact: "five_points")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[impact] ４点" do
        impression = build(:impression, impact: "four_points")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[impact] ３点" do
        impression = build(:impression, impact: "three_points")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[impact] ２点" do
        impression = build(:impression, impact: "two_points")
        impression.valid?
        expect(impression).to be_valid
      end
      
      it "[impact] １点" do
        impression = build(:impression, impact: "one_point")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[practice] ５点" do
        impression = build(:impression, practice: "five_points")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[practice] ４点" do
        impression = build(:impression, practice: "four_points")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[practice] ３点" do
        impression = build(:impression, practice: "three_points")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[practice] ２点" do
        impression = build(:impression, practice: "two_points")
        impression.valid?
        expect(impression).to be_valid
      end
      
      it "[practice] １点" do
        impression = build(:impression, practice: "one_point")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[knowledge] ５点" do
        impression = build(:impression, knowledge: "five_points")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[knowledge] ４点" do
        impression = build(:impression, knowledge: "four_points")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[knowledge] ３点" do
        impression = build(:impression, knowledge: "three_points")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[knowledge] ２点" do
        impression = build(:impression, knowledge: "two_points")
        impression.valid?
        expect(impression).to be_valid
      end
      
      it "[knowledge] １点" do
        impression = build(:impression, knowledge: "one_point")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[rating] ５点" do
        impression = build(:impression, rating: "five_points")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[rating] ４点" do
        impression = build(:impression, rating: "four_points")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[rating] ３点" do
        impression = build(:impression, rating: "three_points")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[rating] ２点" do
        impression = build(:impression, rating: "two_points")
        impression.valid?
        expect(impression).to be_valid
      end
      
      it "[rating] １点" do
        impression = build(:impression, rating: "one_point")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[reread_timing] 知識を付けたい時" do
        impression = build(:impression, reread_timing: "knowledge")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[reread_timing] モチベーションをあげたい時" do
        impression = build(:impression, reread_timing: "motivation")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[reread_timing] なにか決断をする時" do
        impression = build(:impression, reread_timing: "decision")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[reread_timing] ストレスが溜まっている時" do
        impression = build(:impression, reread_timing: "stress")
        impression.valid?
        expect(impression).to be_valid
      end
      
      it "[reread_timing] 落ち込んでいる時" do
        impression = build(:impression, reread_timing: "feel_down")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[reread_timing] 失恋した時" do
        impression = build(:impression, reread_timing: "lost_love")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[reread_timing] 気分転換したい時" do
        impression = build(:impression, reread_timing: "diversion")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[reread_timing] リラックスしたい時" do
        impression = build(:impression, reread_timing: "relax")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[reread_timing] 特になし" do
        impression = build(:impression, reread_timing: "nothing_special")
        impression.valid?
        expect(impression).to be_valid
      end
    end
  end
end