class Wundersubtask < ApplicationRecord
  belongs_to :wundertask

  def from_hash source
    self.title = source[:title]
    self.completed = source[:completed]
    self.createdAt = DateTime.parse source[:createdAt]
    self.completedAt = source[:completedAt].nil? ? nil : (DateTime.parse source[:completedAt])
    self.save
  end

  # def self.find_or_create source
  #   folder = Wunderfolder.where( title: source[:title] )
  #   if folder.empty?
  #     folder =  Wunderfolder.new
  #     folder.from_hash source
  #   end
  #   folder
  # end
end

        # "subtasks": [
        #   {
        #     "title": "https://blog.mailchimp.com/gdpr-tools-from-mailchimp/",
        #     "completed": false,
        #     "completedAt": null,
        #     "createdAt": "2018-07-07T21:00:24.172Z",
        #     "createdBy": {
        #       "id": 1344494,
        #       "name": "wunderlist@justthisguy.org",
        #       "email": "wunderlist@justthisguy.org",
        #       "createdAt": "2011-10-04T03:16:24Z"
        #     }
        #   }
        # ],


# hst1 = [ { "title": "what needs doing", "completed": false, "completedAt": nil, "createdAt": "2018-07-07T20:03:51.994Z", "createdBy": { "id": 1344494, "name": "wunderlist@justthisguy.org", "email": "wunderlist@justthisguy.org", "createdAt": "2011-10-04T03:16:24Z" } } ]
# hst2 = [ { "title": "what's been done", "completed": true, "completedAt": "2018-07-31T16:22:52.731Z", "createdAt": "2018-07-07T20:03:51.994Z", "createdBy": { "id": 1344494, "name": "wunderlist@justthisguy.org", "email": "wunderlist@justthisguy.org", "createdAt": "2011-10-04T03:16:24Z" } } ]

