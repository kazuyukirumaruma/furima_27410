require 'rails_helper'

describe User do
  describe '#create' do

    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without an email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a firstname" do
      user = build(:user, firstname: "")
      user.valid?
      expect(user.errors[:firstname]).to include("can't be blank")
    end

    it "is invalid without a lastname" do
      user = build(:user, lastname: "")
      user.valid?
      expect(user.errors[:lastname]).to include("can't be blank")
    end

    it "is invalid without a kana_first" do
      user = build(:user, kana_first: "")
      user.valid?
      expect(user.errors[:kana_first]).to include("can't be blank")
    end

    it "is invalid without a kana_last" do
      user = build(:user, kana_last: "")
      user.valid?
      expect(user.errors[:kana_last]).to include("can't be blank")
    end

    it "is invalid without a birthday" do
      user = build(:user, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
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
  end
end