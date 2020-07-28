	
FactoryBot.define do
  factory :item do
    name                      {"kkk"}
    explanation               {"kkk"}
    category_id               {2}
    commodity_condition_id    {2}
    shipping_charges_id       {2}
    region_id                 {2}
    shipping_days_id          {2}
    price                     {300}
    # trait :image do
    #   image {Faker::Lorem.sentence}
    association :user
  end
  
end