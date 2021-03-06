require 'rails_helper'

RSpec.describe ShippingDay, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      # @item.image = fixture_file_upload('public/images/test_image.png')
    end

      it '発送までの日数についての情報が必須であること' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送までの日数は1以外の値にしてください")
      end
    
  end
end
