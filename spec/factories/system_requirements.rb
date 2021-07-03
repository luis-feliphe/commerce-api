FactoryBot.define do
  factory :system_requirement do
  sequence(:name) { |n|  "basic #{n}" }
    operational_system { Faker::Computer.os }
    storage { "500gb" }
    processor { "AMD Ryzen 7" }
    memory { "2gb" }
    video_board { "GForce X" }
  end
end

