FactoryBot.define do
  factory :wundertask do
    wunderlist_id { 1 }
    original_id   { 2 }
    title         { "task not completed" }
    completed     { nil }
    starred       { false }
    notes         { [] }
    createdAt     { DateTime.now }
    completedAt   { nil }
    association :wunderlist, factory: :wunderlist
  end
end
