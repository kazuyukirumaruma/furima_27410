require 'rails_helper'

RSpec.describe User, type: :user do
  describe '#create' do

    before do
      @user = FactoryBot.build(:user)
    end

    it "is invalid without a nickname" do
      @user.nickname =  nil
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end

    it "is invalid without an email" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください", "Eメールは不正な値です")
    end

    it "is invalid without a password" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードは6文字以上で入力してください", "パスワードは不正な値です")
    end

    it "is invalid without a firstname" do
      @user.firstname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字を入力してください", "苗字は不正な値です")
    end

    it "is invalid without a lastname" do
      @user.lastname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください", "名前は不正な値です")
    end

    it "is invalid without a kana_first" do
      @user.kana_first = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("カナで苗字を入力してください", "カナで苗字は不正な値です")
    end

    it "is invalid without a kana_last" do
      @user.kana_last = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("カナで名前を入力してください", "カナで名前は不正な値です")
    end

    it "is invalid without a birthday" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("生年月日を入力してください")
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します", "ニックネームはすでに存在します")
    end

    it "is valid with a password that has more than 6 characters " do
      user = build(:user, password: "Wk0000", password_confirmation: "Wk0000")
      expect(user).to be_valid
    end

    it "is invalid with a password that has less than 5 characters " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors.full_messages).to include("パスワードは6文字以上で入力してください", "パスワードは不正な値です")
    end

    it "パスワードを二回入力しない場合 " do
      user = build(:user, password: "000000", password_confirmation: "")
      user.valid?
      expect(user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは不正な値です")
    end

    it "メールアドレスは@を含む必要があること" do
      @user.email = "kkkkkkkkkk"
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end

    it "パスワードは半角英数字混合であること" do
      @user.password = "kkkkkkkkkk"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end

    it "ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること" do
      @user.firstname && @user.lastname = "kkkkkkkkkkkk"
      @user.valid?
      expect(@user.errors.full_messages).to include("名前は不正な値です")
    end

    it "ユーザー本名のフリガナは全角（カタカナ）で入力させること" do
      @user.kana_first && @user.kana_last = "kkkkkkkkkkkk"
      @user.valid?
      expect(@user.errors.full_messages).to include("カナで名前は不正な値です")
    end


    
  end
end