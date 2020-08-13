require 'rails_helper'

RSpec.describe ShippingCharge, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      # @item.image = fixture_file_upload('public/images/test_image.png')
    end

      it '配送料の負担についての情報が必須であること' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は1以外の値にしてください")
      end
    
  end
end
