class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :commodity_condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :region
  belongs_to_active_hash :shipping_day
  with_options presence: true do |s| 

    s.validates :name
    s.validates :explanation
    s.validates :category_id,                     numericality: {only_integer: true, other_than: 1}
    s.validates :commodity_condition_id,          numericality: {only_integer: true, other_than: 1}
    s.validates :shipping_charge_id,             numericality: {only_integer: true, other_than: 1}
    s.validates :region_id,                       numericality: {only_integer: true, other_than: 1}
    s.validates :shipping_day_id,                numericality: {only_integer: true, other_than: 1}
    s.validates :price,                           numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end

end
