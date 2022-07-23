FactoryBot.define do
  factory :wunderfolder do
    title          { "this is a folder" }
    directory_path { "this is the directory_path" }
    createdAt      { DateTime.now }
    updatedAt      { DateTime.now }
  end
end
