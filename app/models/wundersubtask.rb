class Wundersubtask < ApplicationRecord
  belongs_to :wundertask

  def from_hash source
    self.title = source[:title]
    self.completed = source[:completed]
    self.createdAt = DateTime.parse source[:createdAt]
    self.completedAt = source[:completedAt].nil? ? nil : (DateTime.parse source[:completedAt])
    self.save!
    self
  end
end

# hst1 = { "title": "what needs doing", "completed": false, "completedAt": nil, "createdAt": "2018-07-07T20:03:51.994Z", "createdBy": { "id": 1344494, "name": "wunderlist@justthisguy.org", "email": "wunderlist@justthisguy.org", "createdAt": "2011-10-04T03:16:24Z" } }
# hst2 = { "title": "what's been done", "completed": true, "completedAt": "2018-07-31T16:22:52.731Z", "createdAt": "2018-07-07T20:03:51.994Z", "createdBy": { "id": 1344494, "name": "wunderlist@justthisguy.org", "email": "wunderlist@justthisguy.org", "createdAt": "2011-10-04T03:16:24Z" } }

