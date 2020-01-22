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
    end
  end
end