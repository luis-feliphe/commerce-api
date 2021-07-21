# FactoryBot.define do
#     factory :user do
#       sequence(:name) { |n|  "basic #{n}" }
#       name { Faker::Name.name}
#       email { Faker::Internet.email}
#       password {"123456"}
#       password_confirmation {"1234556"}
#       profile { %i(admin client).sample }
#     end
#   end
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { "123456" }
    password_confirmation { "123456" }
    profile { :admin }
  end
end
  
  