class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  with_options presence: true do |s| 

    s.validates :name
    s.validates :explanation
    s.validates :category_id,                     numericality: {only_integer: true, other_than: 1}
    s.validates :commodity_condition_id,          numericality: {only_integer: true, other_than: 1}
    s.validates :shipping_charges_id,             numericality: {only_integer: true, other_than: 1}
    s.validates :region_id,                       numericality: {only_integer: true, other_than: 1}
    s.validates :shipping_days_id,                numericality: {only_integer: true, other_than: 1}
    s.validates :price,                           numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end

end
