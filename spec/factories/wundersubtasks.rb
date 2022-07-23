FactoryBot.define do
  factory :wundersubtask do
    wundertask_id  { 1 }
    title          { "this is a folder" }
    completed      { nil }
    createdAt     { DateTime.now }
    completedAt   { nil }

    association :wundertask, factory: :wundertask
  end
end
