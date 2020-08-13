require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do

    before do
      @item = FactoryBot.build(:item)
      # @item.images = fixture_file_upload('public/images/test_image.png')
    end

      it 'imagesが空では保存できないこと' do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("出品画像を入力してください")
      end

      it 'nameが空では保存できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it 'explanationが空では保存できないこと' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it 'priceが空では保存できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください", "販売価格は数値で入力してください")
      end

      it '価格の範囲が、¥300~¥9,999,999の間であること' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は300以上の値にしてください")
      end
    
  end
end
