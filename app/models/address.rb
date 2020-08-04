class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :prefecture

  # VALID_POST_CODE = /\A\d{3}[-]\d{4}\z/
  # VALID_PHONE_NUMBER = /\A\d{10,11}\z/

  # with_options presence: true do |s| 
  #   s.validates :post_code,            format: { with: VALID_POST_CODE }
  #   s.validates :prefecture_id,        numericality: {only_integer: true, other_than: 1}
  #   s.validates :municipality                     
  #   s.validates :house_number                    
  #   s.validates :phone_number,         format: { with: VALID_PHONE_NUMBER }              
  # end
end

