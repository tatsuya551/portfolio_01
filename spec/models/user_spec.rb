require 'rails_helper'

describe User, type: :model do
  describe '#create' do

    #############################
    # 保存NG確認                 #
    #############################
    context 'can not save' do
      it "[nickname] nil" do
        user = build(:user, nickname: nil)
        user.valid?
        expect(user.errors.messages[:nickname]).to include("を入力してください")
      end

      it "[nickname] 16byte" do
        user = build(:user, nickname: "abcdefghijklmnop")
        user.valid?
        expect(user.errors.messages[:nickname]).to include("は 15文字以下で入力してください")
      end

      it "[email] nil" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors.messages[:email]).to include("を入力してください")
      end

      it "[email] duplication" do
        user = create(:user)
        user = build(:user)
        user.valid?
        expect(user.errors.messages[:email]).to include("はすでに存在します")
      end

      it "[birth_day] nil(all)" do
        user = build(:user, birth_day: nil)
        user.valid?
        expect(user.errors.messages[:birth_day]).to include("を入力してください")
      end

      it "[birth_day] nil(year)" do
        user = build(:user, birth_day: "    -01-01")
        user.valid?
        expect(user.errors.messages[:birth_day]).to include("を入力してください")
      end

      it "[birth_day] nil(month)" do
        user = build(:user, birth_day: "2000-  -01")
        user.valid?
        expect(user.errors.messages[:birth_day]).to include("を入力してください")
      end

      it "[birth_day] nil(day)" do
        user = build(:user, birth_day: "2000-01-  ")
        user.valid?
        expect(user.errors.messages[:birth_day]).to include("を入力してください")
      end

      it "[birth_day] feature date" do
        user = build(:user, birth_day: "2021-01-01")
        user.valid?
        expect(user.errors.messages[:birth_day]).to include("を正確に入力してください")
      end
    end

    #############################
    # 保存OK確認                 #
    #############################
    context 'can save' do
      it "[nickname] 15byte" do
        user = build(:user, nickname: "abcdefghijklmno")
        user.valid?
        expect(user).to be_valid
      end
    end
  end
end