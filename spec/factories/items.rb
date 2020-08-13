	
FactoryBot.define do
  factory :item do
    name                      {"kkk"}
    explanation               {"kkk"}
    category_id               {2}
    commodity_condition_id    {2}
    shipping_charge_id       {2}
    region_id                 {2}
    shipping_day_id          {2}
    price                     {300}

    # trait :images do
    #   images { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test_image.jpg')) }
    #   images(io: File.open('spec/fixtures/test_image.jpg'), filename: 'test_image.jpg', content_type: 'image/jpg')
    # end

    after(:build) do |item|
      item.images.attach(io: File.open("#{Rails.root}/spec/fixtures/test_image.jpg"), filename: 'test_image.jpg', content_type: 'image/jpg')
    end

    association :user
  end
  
end

