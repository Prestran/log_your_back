FactoryBot.define do
  factory :organisation do
    sequence(:name) { |i| "Organisation #{i}" }
  end
end
