require 'rails_helper'

RSpec.describe CommodityCondition, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

      it '商品の状態についての情報が必須であること' do
        @item.commodity_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Commodity condition must be other than 1")
      end
    
  end
end
