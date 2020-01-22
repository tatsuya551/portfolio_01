require 'rails_helper'

describe Book, type: :model do
  describe '#create' do

    #############################
    # 保存NG確認                 #
    #############################
    context 'can not save' do
      it "[title] nil" do
        book = build(:book, title: nil)
        book.valid?
        expect(book.errors.messages[:title]).to include("を入力してください")
      end

      it "[author] nil" do
        book = build(:book, author: nil)
        book.valid?
        expect(book.errors.messages[:author]).to include("を入力してください")
      end

      it "[publisher] nil" do
        book = build(:book, publisher: nil)
        book.valid?
        expect(book.errors.messages[:publisher]).to include("を入力してください")
      end

      it "[status] nil" do
        book = build(:book, status: nil)
        book.valid?
        expect(book.errors.messages[:status]).to include("を入力してください")
      end

      it "[buy_date] nil(all)" do
        book = build(:book, buy_date: nil)
        book.valid?
        expect(book.errors.messages[:buy_date]).to include("を入力してください")
      end

      it "[buy_date] nil(year)" do
        book = build(:book, buy_date: "    -01-01")
        book.valid?
        expect(book.errors.messages[:buy_date]).to include("を入力してください")
      end

      it "[buy_date] nil(month)" do
        book = build(:book, buy_date: "2020-  -01")
        book.valid?
        expect(book.errors.messages[:buy_date]).to include("を入力してください")
      end

      it "[buy_date] nil(day)" do
        book = build(:book, buy_date: "2020-01-  ")
        book.valid?
        expect(book.errors.messages[:buy_date]).to include("を入力してください")
      end

      it "[buy_date] feature date" do
        book = build(:book, buy_date: "2021-01-01")
        book.valid?
        expect(book.errors.messages[:buy_date]).to include("を正確に入力してください")
      end

      it "[category] nil" do
        book = build(:book, category: nil)
        book.valid?
        expect(book.errors.messages[:category]).to include("を選択してください")
      end
    end

    #############################
    # 保存OK確認                 #
    #############################
    context 'can save' do
      it "[book] all ok" do
        book = build(:book)
        book.valid?
        expect(book).to be_valid
      end

      it "[category] 経営・戦略" do
        book = build(:book, category: "経営・戦略")
        book.valid?
        expect(book).to be_valid
      end

      it "[category] 政治・経済" do
        book = build(:book, category: "政治・経済")
        book.valid?
        expect(book).to be_valid
      end

      it "[category] 金融・ファイナンス" do
        book = build(:book, category: "金融・ファイナンス")
        book.valid?
        expect(book).to be_valid
      end

      it "[category] IT" do
        book = build(:book, category: "IT")
        book.valid?
        expect(book).to be_valid
      end

      it "[category] 自己啓発" do
        book = build(:book, category: "自己啓発")
        book.valid?
        expect(book).to be_valid
      end

      it "[category] タレント本" do
        book = build(:book, category: "タレント本")
        book.valid?
        expect(book).to be_valid
      end

      it "[category] その他" do
        book = build(:book, category: "その他")
        book.valid?
        expect(book).to be_valid
      end
    end
  end
end