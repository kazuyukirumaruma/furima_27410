require 'rails_helper'

RSpec.describe Region, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      # @item.image = fixture_file_upload('public/images/test_image.png')
    end

    it '発送元の地域についての情報が必須であること' do
      @item.region_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("配送元の地域は1以外の値にしてください")
    end
    
  end
end
