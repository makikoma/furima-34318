FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials}
    email {Faker::Internet.free_email}
    password {Faker::Alphanumeric.alphanumeric(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    last_name {'苗字'}
    first_name {'名前'}
    last_name_kana {'セイ'}
    first_name_kana {'メイ'}
    birth_data {Faker::Date.birthday}
  end
end