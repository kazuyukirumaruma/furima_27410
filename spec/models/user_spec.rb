require 'rails_helper'

describe User do
  describe '#create' do

    before :context do
      @user = FactoryBot.build(:user)
    end

    it "is invalid without a nickname" do
      @user.nickname =  ""
      @user.valid?
      expect(@user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without an email" do
      @user.email = ""
      @user.valid?
      expect(@user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      @user.password = ""
      @user.valid?
      expect(@user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a firstname" do
      @user.firstname = ""
      @user.valid?
      expect(@user.errors[:firstname]).to include("can't be blank")
    end

    it "is invalid without a lastname" do
      @user.lastname = ""
      @user.valid?
      expect(@user.errors[:lastname]).to include("can't be blank")
    end

    it "is invalid without a kana_first" do
      @user.kana_first = ""
      @user.valid?
      expect(@user.errors[:kana_first]).to include("can't be blank")
    end

    it "is invalid without a kana_last" do
      @user.kana_last = ""
      @user.valid?
      expect(@user.errors[:kana_last]).to include("can't be blank")
    end

    it "is invalid without a birthday" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors[:birthday]).to include("can't be blank")
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "is valid with a password that has more than 6 characters " do
      user = build(:user, password: "Wk0000", password_confirmation: "Wk0000")
      expect(user).to be_valid
    end

    it "is invalid with a password that has less than 5 characters " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end

    it "パスワードを二回入力しない場合 " do
      user = build(:user, password: "000000", password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "メールアドレスは@を含む必要があること" do
      @user.email = "kkkkkkkkkk"
      @user.valid?
      expect(@user.errors[:email]).to include("is invalid")
    end

    it "パスワードは半角英数字混合であること" do
      @user.password = "kkkkkkkkkk"
      @user.valid?
      expect(@user.errors[:password]).to include("is invalid")
    end

    it "ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること" do
      @user.firstname && lastname = "kkkkkkkkkkkk"
      @user.valid?
      expect(@user.errors[:firstname && :lastname]).to include("is invalid")
    end

    it "ユーザー本名のフリガナは全角（カタカナ）で入力させること" do
      @user.kana_first && kana_last = "kkkkkkkkkkkk"
      @user.valid?
      expect(@user.errors[:kana_first && :kana_last]).to include("is invalid")
    end


    
  end
end