FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name {'苗字'}
    first_name {'名前'}
    last_name_kana {'セイ'}
    first_name_kana {'メイ'}
    birth_data {Faker::Date.birthday}
  end
end