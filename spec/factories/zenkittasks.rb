FactoryBot.define do
  factory :zenkittask do
    title           { "this is a task" }
    stage           { "stage" }
    due_date        { "due_date" }
    notes           { "notes" }
    files           { "files" }
    assigned_to     { "assigned_to" }
    created         { DateTime.now }
    created_by      { "created_by" }
    last_updated    { DateTime.now }
    last_updated_by { "last_updated_by" }
    comments        { "comments" }

    association :zenkitlist, factory: :zenkitlist
  end
end
