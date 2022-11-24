FactoryBot.define do
  factory :zenkitlist do
    title           { "this is a list" }

    association :zenkitfolder, factory: :zenkitfolder
  end
end
