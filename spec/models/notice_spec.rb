require 'rails_helper'

describe Notice, type: :model do
  describe '#create' do
    #############################
    # 保存NG確認                 #
    #############################
    context 'can not save' do
      it "[content] nil" do
        notice = build(:notice, content: nil)
        notice.valid?
        expect(notice.errors.messages[:content]).to include("を入力してください")
      end

      it "[date] nil" do
        notice = build(:notice, date: nil)
        notice.valid?
        expect(notice.errors.messages[:date]).to include("を入力してください")
      end

      it "[status] nil" do
        notice = build(:notice, status: nil)
        notice.valid?
        expect(notice.errors.messages[:status]).to include("を入力してください")
      end
    end

    #############################
    # 保存OK確認                 #
    #############################
    context 'can save' do
      it "[notice] all ok" do
        notice = build(:notice)
        notice.valid?
        expect(notice).to be_valid
      end

      it "[impression_id] nil" do
        notice = build(:notice, impression_id: nil)
        notice.valid?
        expect(notice).to be_valid
      end
    end
  end
end
