FactoryBot.define do
  factory :user do
    nickname              {'TestName'}
    email                 {Faker::Internet.free_email}
    password              {'test1010'}
    password_confirmation {password}
    family_name           {'てすと'}
    first_name            {'太郎'}
    family_name_reading   {'テスト'}
    first_name_reading    {'タロウ'}
    birthday              {1930101}
  end
end