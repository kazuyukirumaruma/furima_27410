require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do

    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

      it 'imageが空では保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors[:image]).to include("can't be blank")
      end

      it 'nameが空では保存できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors[:name]).to include("can't be blank")
      end

      it 'explanationが空では保存できないこと' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors[:explanation]).to include("can't be blank")
      end

      it 'priceが空では保存できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors[:price]).to include("can't be blank")
      end

      it '価格の範囲が、¥300~¥9,999,999の間であること' do
        @item.price = 200
        @item.valid?
        expect(@item.errors[:price]).to include("must be greater than or equal to 300")
      end
    
  end
end
