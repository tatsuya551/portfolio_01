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
        impression = build(:impression, read_day: "1日")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[read_day] 2日〜3日" do
        impression = build(:impression, read_day: "2日〜3日")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[read_day] 1週間" do
        impression = build(:impression, read_day: "1週間")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[read_day] 2週間〜4週間" do
        impression = build(:impression, read_day: "2週間〜4週間")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[read_day] 1ヶ月以上" do
        impression = build(:impression, read_day: "1ヶ月以上")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[interest] ５点" do
        impression = build(:impression, interest: "５点")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[interest] ４点" do
        impression = build(:impression, interest: "４点")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[interest] ３点" do
        impression = build(:impression, interest: "３点")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[interest] ２点" do
        impression = build(:impression, interest: "２点")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[interest] １点" do
        impression = build(:impression, interest: "１点")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[impressed] ５点" do
        impression = build(:impression, impressed: "５点")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[impressed] ４点" do
        impression = build(:impression, impressed: "４点")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[impressed] ３点" do
        impression = build(:impression, impressed: "３点")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[impressed] ２点" do
        impression = build(:impression, impressed: "２点")
        impression.valid?
        expect(impression).to be_valid
      end
      
      it "[impressed] １点" do
        impression = build(:impression, impressed: "１点")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[awareness] ５点" do
        impression = build(:impression, awareness: "５点")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[awareness] ４点" do
        impression = build(:impression, awareness: "４点")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[awareness] ３点" do
        impression = build(:impression, awareness: "３点")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[awareness] ２点" do
        impression = build(:impression, awareness: "２点")
        impression.valid?
        expect(impression).to be_valid
      end
      
      it "[awareness] １点" do
        impression = build(:impression, awareness: "１点")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[impact] ５点" do
        impression = build(:impression, impact: "５点")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[impact] ４点" do
        impression = build(:impression, impact: "４点")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[impact] ３点" do
        impression = build(:impression, impact: "３点")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[impact] ２点" do
        impression = build(:impression, impact: "２点")
        impression.valid?
        expect(impression).to be_valid
      end
      
      it "[impact] １点" do
        impression = build(:impression, impact: "１点")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[practice] ５点" do
        impression = build(:impression, practice: "５点")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[practice] ４点" do
        impression = build(:impression, practice: "４点")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[practice] ３点" do
        impression = build(:impression, practice: "３点")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[practice] ２点" do
        impression = build(:impression, practice: "２点")
        impression.valid?
        expect(impression).to be_valid
      end
      
      it "[practice] １点" do
        impression = build(:impression, practice: "１点")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[knowledge] ５点" do
        impression = build(:impression, knowledge: "５点")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[knowledge] ４点" do
        impression = build(:impression, knowledge: "４点")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[knowledge] ３点" do
        impression = build(:impression, knowledge: "３点")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[knowledge] ２点" do
        impression = build(:impression, knowledge: "２点")
        impression.valid?
        expect(impression).to be_valid
      end
      
      it "[knowledge] １点" do
        impression = build(:impression, knowledge: "１点")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[rating] ５点" do
        impression = build(:impression, rating: "５点")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[rating] ４点" do
        impression = build(:impression, rating: "４点")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[rating] ３点" do
        impression = build(:impression, rating: "３点")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[rating] ２点" do
        impression = build(:impression, rating: "２点")
        impression.valid?
        expect(impression).to be_valid
      end
      
      it "[rating] １点" do
        impression = build(:impression, rating: "１点")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[reread_timing] 知識を付けたい時" do
        impression = build(:impression, reread_timing: "知識を付けたい時")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[reread_timing] モチベーションをあげたい時" do
        impression = build(:impression, reread_timing: "モチベーションをあげたい時")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[reread_timing] なにか決断をする時" do
        impression = build(:impression, reread_timing: "なにか決断をする時")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[reread_timing] ストレスが溜まっている時" do
        impression = build(:impression, reread_timing: "ストレスが溜まっている時")
        impression.valid?
        expect(impression).to be_valid
      end
      
      it "[reread_timing] 落ち込んでいる時" do
        impression = build(:impression, reread_timing: "落ち込んでいる時")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[reread_timing] 失恋した時" do
        impression = build(:impression, reread_timing: "失恋した時")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[reread_timing] 気分転換したい時" do
        impression = build(:impression, reread_timing: "気分転換したい時")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[reread_timing] リラックスしたい時" do
        impression = build(:impression, reread_timing: "リラックスしたい時")
        impression.valid?
        expect(impression).to be_valid
      end

      it "[reread_timing] 特になし" do
        impression = build(:impression, reread_timing: "特になし")
        impression.valid?
        expect(impression).to be_valid
      end
    end
  end
end