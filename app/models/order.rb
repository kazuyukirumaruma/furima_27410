class Order < ApplicationRecord
  has_one :item
  belongs_to :user

  # with_options presence: true do |s| 

  #   s.validates :user_id
  #   s.validates :item_id
end
