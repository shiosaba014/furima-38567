FactoryBot.define do
  factory :consumer_buyer do
    post_code { '000-0000' }
    address_id { 3 }
    municipalities { Faker::Address.city }
    address_number { Faker::Address.secondary_address }
    building       { Faker::Address.building_number }
    tel            { '11111111111' }
    token          {"tok_abcdefghijk00000000000000000"}
  end
end
