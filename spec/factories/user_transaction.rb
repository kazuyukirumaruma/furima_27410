	
FactoryBot.define do
  factory :user_transaction do
    post_code         { '111-1111' }
    prefecture_id     { 2 }
    municipality      { '横浜市緑区' }
    house_number      { '青山1-1-1' }
    building          {'柳ビル103'}
    phone_number      { '09012345678' }
    user_id           { 1 }
    item_id           { 2 }
  end
end