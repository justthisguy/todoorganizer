class Wundertask < ApplicationRecord
  belongs_to :wunderlist
  has_many :wundersubtasks

  def from_hash source
    self.original_id = source[:id]
    self.title       = source[:title]
    self.completed   = source[:completed]
    self.starred     = source[:starred]
    self.createdAt   = DateTime.parse source[:createdAt]
    self.completedAt = source[:completedAt].nil? ? nil : (DateTime.parse source[:completedAt])
    self.save!

    self.handle_subtasks source[:subtasks]
    self.handle_notes    source[:notes]
    self
  end

  def handle_notes notes_array
    return if notes_array.empty?

    notes_array.each do |note_hash|
      note_from_hash note_hash
    end
  end

  def note_from_hash note_hash
    return false if note_hash.empty?
    return false if note_hash[:content].lstrip.empty?
    self.notes << note_hash[:content]
    self.save!
  end

  def handle_subtasks subtasks_array
    return if subtasks_array.empty?

    subtasks_array.each do |subtask_hash|
      self.wundersubtasks.new.from_hash subtask_hash
    end
  end
end

### TODO: handle comments, reminders, assignee, files

# { "id": 4158461911, "title": "vinegar", "completed": true, "starred": false, "subtasks": [], "notes": [], "comments": [], "reminders": [], "files": [], "assignee": null, "dueDate": null, "createdAt": "2018-08-25T01:34:54.968Z", "createdBy": { "id": 1344494, "name": "wunderlist@justthisguy.org", "email": "wunderlist@justthisguy.org", "createdAt": "2011-10-04T03:16:24Z" }, "completedAt": "2019-07-05T21:47:57.425Z", "completedBy": { "id": 1344494, "name": "wunderlist@justthisguy.org", "email": "wunderlist@justthisguy.org", "createdAt": "2011-10-04T03:16:24Z" } }

# "subtasks": [], see subtasks
# "notes": [ { "content": "this is the note" }, { "content": "" } ]
# "comments": [],  no comments
# "reminders": [], ignore

# "files": [
#   {
#     "id": "63527455",
#     "fileName": "QuakeFeed Privacy Policy and Terms of Service.pdf",
#     "filePath": "Tech/QuakeFeed Privacy Policy and Terms of Service.pdf",
#     "fileSize": 199921,
#     "downloadUrl": "https://download.wunderlist.io/13573110-80c9-0137-d683-22000b0b2373-1562272482-34993?AWSAccessKeyId=AKIAJEN6W4AO3LJODOAA&Expires=1582254173&Signature=YgdQPLnbl7v0Ej87qDONgQej4Vs%3D",
#     "isDropboxFile": false,
#     "user": {
#       "id": 1344494,
#       "name": "wunderlist@justthisguy.org",
#       "email": "wunderlist@justthisguy.org",
#       "createdAt": "2011-10-04T03:16:24Z"
#     },
#     "localCreatedAt": "2019-07-04T20:34:44.365Z",
#     "createdAt": "2019-07-04T20:34:44.544Z",
#     "updatedAt": "2020-01-21T03:02:53.323Z"
#   }
# ],
