FactoryBot.define do
  factory :wunderlist do
    original_id    { 1 }
    title          { "this is a folder" }
    directory_path { "this is the directory_path" }
    text_file_path { "this is the text_file_path" }
    html_file_path { "this is the html_file_path" }

    association :wunderfolder, factory: :wunderfolder
  end
end
