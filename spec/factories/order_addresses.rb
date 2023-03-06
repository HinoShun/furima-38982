FactoryBot.define do
  factory :order_address do
    token         {'TOKENtoken'}
    post_code     {'000-0000'}
    prefecture_id {'1'}
    city          {'シティ'}
    house_number  {'1-1-1'}
    building      {'ビルディング'}
    phone_number  {'09012345678'}

  end
end
