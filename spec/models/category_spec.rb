require 'rails_helper'

RSpec.describe Category, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      # @item.image = fixture_file_upload('public/images/test_image.png')
    end

      it 'カテゴリーの情報が必須であること' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
      end
  end
end
