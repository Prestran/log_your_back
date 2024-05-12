FactoryBot.define do
  factory :backlog do
    sequence(:name) { |n| "Backlog#{n}" }
    type { 'Type1' }
    content {  }
    due_at { Date.today + 10 }
  end
end
