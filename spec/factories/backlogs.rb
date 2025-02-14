FactoryBot.define do
  factory :backlog do
    sequence(:name) { |n| "Backlog#{n}" }
    backlog_type { 'Type1' }
    due_at { Time.zone.today + 10 }
  end
end
