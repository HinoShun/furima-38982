FactoryBot.define do
  factory :item do
    item_name             {'TestItem'}
    content               {'商品説明20文字000123456789'}
    category_id           {'1'}
    condition_id          {'1'}
    postage_id            {'1'}
    prefecture_id         {'1'}
    shipping_day_id       {'1'}
    price                 {'1000'}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
