FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    explan {Faker::Lorem.paragraph}
    category_id {2}
    situation_id {2}
    delivery_charge_id {2}
    address_id {2}
    period_id {2}
    price {Faker::Number.number(digits:10)}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
