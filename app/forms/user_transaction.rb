class UserTransaction

  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefecture_id, :municipality, :house_number, :building, :phone_number, :user_id, :item_id

  VALID_POST_CODE = /\A\d{3}[-]\d{4}\z/
  VALID_PHONE_NUMBER = /\A\d{10,11}\z/

  with_options presence: true do |s| 
    s.validates :post_code,            format: { with: VALID_POST_CODE }
    s.validates :prefecture_id,        numericality: {only_integer: true, other_than: 1}
    s.validates :municipality                     
    s.validates :house_number                    
    s.validates :phone_number,         format: { with: VALID_PHONE_NUMBER }         

    s.validates :user_id
    s.validates :item_id
  end

  def save
  
    # 住所の情報を保存
    Address.create(phone_number: phone_number, post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number, building: building, user_id: user_id, item_id: item_id)
    # 寄付金の情報を保存
    Order.create(item_id: item_id, user_id: user_id)
  end

end