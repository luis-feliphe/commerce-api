FactoryBot.define do
  factory :coupon do
    name { "MyString" }
    code { Faker::Commerce.unique.promotion_code(digits: 6) }
    status { %i(active inactive).sample }
    discount_value { rand(1..99) }
    due_date { "2021-07-03 12:16:41" }
  end
end
