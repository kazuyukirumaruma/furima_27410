require 'rails_helper'

RSpec.describe UserTransaction, type: :model do
  describe '寄付情報の保存' do
    before do
      @user_transaction = FactoryBot.build(:user_transaction)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_transaction).to be_valid
    end
    it 'post_codeが空だと保存できないこと' do
      @user_transaction.post_code = nil
      @user_transaction.valid?
      expect(@user_transaction.errors.full_messages).to include("Post code can't be blank", "Post code is invalid")
    end
    it 'prefectureの情報が必須であること' do
      @user_transaction.prefecture_id = 1
      @user_transaction.valid?
      expect(@user_transaction.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it 'municipalityが空だと保存できないこと' do
      @user_transaction.municipality = nil
      @user_transaction.valid?
      expect(@user_transaction.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'house_numberが空だと保存できないこと' do
      @user_transaction.house_number = nil
      @user_transaction.valid?
      expect(@user_transaction.errors.full_messages).to include("House number can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @user_transaction.phone_number = nil
      @user_transaction.valid?
      expect(@user_transaction.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
    end
    it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @user_transaction.post_code = '1234567'
      @user_transaction.valid?
      expect(@user_transaction.errors.full_messages).to include("Post code is invalid")
    end
    it '電話番号にはハイフンは不要で、11桁以内であること' do
      @user_transaction.phone_number = '080123456789'
      @user_transaction.valid?
      expect(@user_transaction.errors.full_messages).to include("Phone number is invalid")
    end
  end
end