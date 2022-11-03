FactoryBot.define do
  factory :buyer do
    post_code { 0o00 - 0o000 }
    address_id { 3 }
    municipalities { Faker::Address.city }
  end
end
