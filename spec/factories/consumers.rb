FactoryBot.define do
  factory :consumer do
    association :user
    association :item
  end
end
