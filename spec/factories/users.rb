FactoryBot.define do
  factory :user do
    nickname                { Faker::Name.initials(number: 2) }
    email                   { Faker::Internet.free_email }
    password                { 'test11111' }
    password_confirmation   { password }
    family_name             { '山田' }
    first_name              { '太郎' }
    family_name_kana        { 'ヤマダ' }
    first_name_kana         { 'タロウ' }
    birth                   { '1930-01-01' }
  end
end
